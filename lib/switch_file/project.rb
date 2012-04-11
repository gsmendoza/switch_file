module SwitchFile
  class Project < Valuable
    has_value :path

    def config_path
      "#{path}/.switch_file"
    end

    def file_type_attributes
      eval(Pow(config_path).read)
    end

    def file_type_with_shortcut(shortcut)
      file_types.detect{|file_type| shortcut.to_s == file_type.shortcut.to_s}
    end

    def file_types
      @file_types ||= file_type_attributes.map{|attributes| FileType.new(attributes) }
    end
  end
end
