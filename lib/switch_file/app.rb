module SwitchFile
  class App < Thor
    default_task :execute

    desc "[execute] [OPTIONS]...", "Switch to the matching file type of PATH."

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

      begin
        shortcut = options['shortcut'] || ask(source.prompt_message)

        unless shortcut.strip.empty?
          target_command = source.project.file_type_with_shortcut!(shortcut).generate_open_command(source)
          `#{target_command}`
        end

      rescue SwitchFile::Exception => exception
        if SwitchFile.production?
          say "#{exception.class.to_s.demodulize.underscore.humanize}: #{exception.message}"
          retry
        end
      end
    end

    def help
      say "switch_file #{VERSION}"
      super
    end
  end
end

