{CompositeDisposable} = require 'atom'

module.exports =
  config:
    executablePath:
      type: 'string'
      title: 'rst-lint executable path'
      default: 'rst-lint'

  activate: ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.config.observe 'linter-restructured.executablePath',
      (executablePath) =>
        @executablePath = executablePath

  deactivate: ->
    @subscriptions.dispose()

  provideLinter: ->
    helpers = require('atom-linter')
    provider =
      name: 'linter-restructured'
      grammarScopes: ['text.reStructuredText', 'source.rst', 'text.restructuredtext source.gfm.restructuredtext']
      scope: 'file' # or 'project'
      lintOnFly: true # must be false for scope: 'project'
      lint: (textEditor) =>
        filePath = textEditor.getPath()
        return Promise.resolve([]) unless @executablePath
        parameters = []
        parameters.push("--format=json")
        return helpers.exec(@executablePath, [parameters, filePath], {stream: 'stdout'})
          .then(JSON.parse)
          .then (contents) ->
            toReturn = []
            for record in contents
              line = record.line
              col = 0
              etype = record.type
              toReturn.push({
                type: if etype is 'INFO' then 'WARNING' else if etype is 'SEVERE' then 'WARNING' else record.type,
                text: record.full_message,
                filePath: filePath,
                range: [[line - 1, col - 1], [line - 1, col]]
              })
            return toReturn
