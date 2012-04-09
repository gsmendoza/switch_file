require 'spec_helper'

describe SwitchFile::FileType do
  describe "#all" do
    it "should be the set file types, if available" do
      file_type = FileType.new(shortcut: :s)
      FileType.all = [file_type]
      FileType.all.should == [file_type]
    end

    it "should be the file types from the file_type_attributes, if there are no set file types" do
      FileType.all = nil

      SwitchFile.file_type_attributes = [{shortcut: :s}]

      FileType.all.should have(1).file_type
      FileType.all[0].shortcut.should == :s
    end
  end
end
