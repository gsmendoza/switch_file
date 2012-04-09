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
  end
end