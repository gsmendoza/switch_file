module SwitchFile
  # A type of file within the project
  class FileType < Valuable
    has_value :shortcut

    def self.all
      @all || SwitchFile.file_type_attributes.map{|attributes| FileType.new(attributes) }
    end

    def self.all=(file_types)
      @all = file_types
    end
  end
end