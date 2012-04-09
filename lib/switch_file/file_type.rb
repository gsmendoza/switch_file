module SwitchFile
  # A type of file within the project
  class FileType < Valuable
    has_value :open_command
    has_value :path_regex
    has_value :shortcut

    def self.all
      @all ||= SwitchFile.file_type_attributes.map{|attributes| FileType.new(attributes) }
    end

    def self.all=(file_types)
      @all = file_types
    end

    def generate_open_command(source_path)
      open_command.call(source_path.class_name)
    end
  end
end