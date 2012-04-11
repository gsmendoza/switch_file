module SwitchFile
  class App < Thor
    desc "execute PATH [OPTIONS]...", "Switch to the matching file type of PATH."

    method_option "shortcut",
      :aliases => "-s",
      :desc => "the shortcut of the file type you wish to open",
      :type => :string

    def execute(source_path)
      sp = SourcePath.new(:value => source_path)
      shortcut = options['shortcut'] || ask(sp.prompt_message)
      target_command = sp.project.file_type_with_shortcut(shortcut).generate_open_command(sp)
      `#{target_command}`
    end
  end
end

