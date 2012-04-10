require 'spec_helper'

describe SwitchFile::FileTypeShortcut do
  describe "#file_type" do
    it "should be the file_type with the same name as the short cut" do
      file_type = FileType.new(:shortcut => :s)
      FileType.all = [file_type]

      short_cut = described_class.new(:value => :s)
      short_cut.file_type.shortcut.should == :s
    end

    it "should be nil if there is no matching file type" do
      file_type = FileType.new(:shortcut => :l)
      FileType.all = [file_type]

      short_cut = described_class.new(:value => :s)
      short_cut.file_type.should be_nil
    end
  end
end
