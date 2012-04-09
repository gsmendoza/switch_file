module SwitchFile
  # Short cut of a FileType
  class FileTypeShortcut < Valuable
    has_value :value

    def file_type
      FileType.all.detect{|file_type| self.value == file_type.shortcut}
    end
  end
end