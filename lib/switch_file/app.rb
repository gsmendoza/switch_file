module SwitchFile
  class App < Thor
    default_task :execute

    desc "execute [OPTIONS]...", "Switch to the matching file type of PATH."

    method_option "shortcut",
      :aliases => "-s",
      :desc => "the shortcut of the file type you wish to open",
      :type => :string

    method_option "path",
      :aliases => "-p",
      :desc => "the path of the source file",
      :type => :string,
      :required => true

    def execute
      source = Source.new(:path => options['path'])
      shortcut = options['shortcut'] || ask(source.prompt_message)
      target_command = source.project.file_type_with_shortcut(shortcut).generate_open_command(source)
      `#{target_command}`
    end
  end
end

