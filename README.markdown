SwitchFile
----------

SwitchFile is a simple gem for opening a file related to a currently open file.

Usage
-----

1. Install SwitchFile

    gem install switch_file

1. Add a `.switch_file` to your project root directory. A `.switch_file` is a
  plain ruby file containing an array of hashes. Each hash represents
  a file type. A file type has the following attributes:

  * name - name of the file type
  * shortcut - a short, unique key for the file type
  * path_generator - a ruby block that will determine the path of the
    matching file type of a class name
  * path_regex - a regex that determines if a file path matches the file
    type
  * command - the editor that will open the file

  You can find sample SwitchFile configuration files at the examples.

1. Configure your editor to launch switch_file based on the current file. With [geany](http://www.geany.org),

  1. Go to Build/Set Build Commands.
  1. Change the execute command to `switch_file --path %d/%f`.
  1. Running Build/Execute will now launch switch_file based on the currently
    open file.