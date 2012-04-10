module SwitchFile
  class App < Thor
    desc "execute PATH [OPTIONS]...", "Switch to the matching file type of PATH."

    method_option "shortcut",
      :aliases => "-s",
      :desc => "the shortcut of the file type you wish to open",
      :type => :string

    method_option "config",
      :aliases => "-c",
      :desc => "configuration path of the project. PRESENT_WORKING_DIRECTORY/.switch_file by default.",
      :type => :string

    def execute(source_path)
      SwitchFile.config_path = options['config']
      sp = SourcePath.new(value: source_path)
      shortcut = FileTypeShortcut.new(value: options['shortcut'] ||  ask(sp.prompt_message))
      target_command = shortcut.file_type.generate_open_command(sp)
      `#{target_command}`
    end
  end
end

