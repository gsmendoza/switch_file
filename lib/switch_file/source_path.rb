module SwitchFile
  # Path to a source file
  class SourcePath < Valuable
    has_value :value

    def class_name
      value.match(file_type.path_regex)[1]
    end

    def file_type
      FileType.all.detect{|file_type| value =~ file_type.path_regex }
    end

    def prompt_message
      file_type_options = FileType.all.map{|file_type|
        "[#{file_type.shortcut}] #{file_type.name}: #{file_type.generate_open_command(self)}"
      }

      "Enter the shortcut of the file you want to open:\n\n#{file_type_options.join("\n")}\n\n"
    end
  end
end