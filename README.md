linter-restructured
=========================

This linter plugin for [Linter](https://github.com/AtomLinter/Linter) provides an interface to [restructuredtext-lint](https://github.com/twolfson/restructuredtext-lint). It will be used with rst files.

#### Installation
Linter package must be installed in order to use this plugin. If Linter is not installed, please follow the instructions [here](https://github.com/AtomLinter/Linter).

#### restructuredtext-lint installation
Before using this plugin, you must ensure that `restructuredtext-lint` is installed on your system. To install `restructuredtext-lint`, do the following:

1. Install [restructuredtext-lint](https://github.com/twolfson/restructuredtext-lint) by typing the following in a terminal:
   ```
   cd /tmp

   git clone https://github.com/Iyozhikov/linter-restructured

   git clone https://github.com/twolfson/restructuredtext-lint

   cp linter-restructured/rst-linter.patch restructuredtext-lint/

   cd restructuredtext-lint

   patch -p1 < rst-linter.patch

   python setup.py sdist

   sudo pip install dist/restructuredtext_lint-0.12.4.tar.gz
   ```

Now you can proceed to install the linter-rest plugin.

#### Plugin installation
Extract contents into ~/.atom/packages/:
   ```
   cp -r /tmp/linter-restructured ~/.atom/packages/
   ```
Install [language-restructuredtext](https://atom.io/packages/language-restructuredtext)
   ```
   apm install language-restructuredtext
   ```
#### Settings
You can configure linter-rest from the settings menu:
* **ExecutablePath** Path to your rst-lint executable.

#### Contributing
Thank you for helping out!
