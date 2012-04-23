module SwitchFile
  class Exception < ::Exception
    def message
      "#{self.class.to_s.demodulize.underscore.humanize}: #{super}"
    end
  end
end