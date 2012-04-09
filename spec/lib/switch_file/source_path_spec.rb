require 'spec_helper'

describe SwitchFile::SourcePath do
  describe "#class_name" do
    it "should be the part of the value that is the class name of the source path" do
      FileType.all = [FileType.new(path_regex: %r{lib/(.*).rb$})]

      source_path = SourcePath.new(value: '/home/user/project/lib/project/some_class.rb')
      source_path.class_name.should == 'project/some_class'
    end
  end

  describe "#file_type" do
    it "should be the file type that matches the source path" do
      file_type = FileType.new(path_regex: %r{lib/(.*).rb$})
      FileType.all = [file_type]

      source_path = SourcePath.new(value: '/home/user/project/lib/project/some_class.rb')
      source_path.file_type.should == file_type
    end
  end
end
