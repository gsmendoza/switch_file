module SwitchFile
  class App < Thor
    desc "run PATH [OPTIONS]...", "Switch to the matching file type of PATH."

    method_option "shortcut",
      :aliases => "-s",
      :desc => "the shortcut of the file type you wish to open",
      :type => :string

    def execute(source_path)
      SwitchFile.config_path = Pow(options['config'])
      sp = SourcePath.new(value: source_path)
      shortcut = FileTypeShortcut.new(value: options['shortcut'] ||  ask(sp.prompt))
      target_command = shortcut.file_type.generate_open_command(sp)
      `#{target_command}`
    end
  end
end

