require 'spec_helper'

describe SwitchFile::Project do
  describe "#file_type_with_shortcut" do
    it "should be the file_type with the same name as the shortcut" do
      file_type = FileType.new(:shortcut => :s)
      project = Project.new
      project.should_receive(:file_types).and_return([file_type])

      project.file_type_with_shortcut(:s).shortcut.should == :s
    end

    it "should be nil if there is no matching file type" do
      file_type = FileType.new(:shortcut => :r)
      project = Project.new
      project.should_receive(:file_types).and_return([file_type])

      project.file_type_with_shortcut(:s).should be_nil
    end
  end

  describe "#file_types" do
    it "should be the file types from the file_type_attributes" do
      project = Project.new
      project.should_receive(:file_type_attributes).and_return([{:shortcut => :s}])

      project.file_types.should have(1).file_type
      project.file_types[0].shortcut.should == :s
    end
  end

  describe "#file_type_attributes" do
    it "should be the file_type_attributes from the config_path, if there are no set file_type_attributes" do
      project = Project.new(:path => 'spec/fixtures/project')
      Pow(project.config_path).should be_file
      project.file_type_attributes.should be_an(Array)
    end
  end

  describe "#config_path" do
    it "should be the .switch_file in the path" do
      project = Project.new(:path => 'spec/fixtures/project')
      project.config_path.should == 'spec/fixtures/project/.switch_file'
    end
  end
end
