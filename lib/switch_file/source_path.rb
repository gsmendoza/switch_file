module SwitchFile
  # Path to a source file
  class SourcePath < Valuable
    has_value :value

    def self.project_path(path)
      parent = Pow(path).parent
      if (parent / '.switch_file').file?
        parent.to_s
      elsif parent == Pow(path)
        raise CannotFindProjectPath.new(path.to_s)
      else
        project_path(parent)
      end
    end

    def class_name
      value.match(file_type.path_regex)[1]
    end

    def file_type
      project.file_types.detect{|file_type| value =~ file_type.path_regex }
    end

    def project
      @project ||= Project.new(:path => self.class.project_path(value))
    end

    def prompt_message
      file_type_options = project.file_types.map{|file_type|
        "[#{file_type.shortcut}] #{file_type.name}: #{file_type.relative_path(self)}"
      }

      "Enter the shortcut of the file you want to open:\n\n#{file_type_options.join("\n")}\n\n"
    end

    class CannotFindProjectPath < Exception
    end
  end
end