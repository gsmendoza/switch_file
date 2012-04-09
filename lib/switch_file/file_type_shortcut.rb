module SwitchFile
  # Short cut of a FileType
  class FileTypeShortcut < Valuable
    has_value :value

    def file_type
      FileType.all.detect{|file_type| self.value.to_s == file_type.shortcut.to_s}
    end
  end
end