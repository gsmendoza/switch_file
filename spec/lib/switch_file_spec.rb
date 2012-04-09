require 'spec_helper'

describe SwitchFile do
  describe ".config_path" do
    it "should be the .switch_file in the present working directory, by default" do
      SwitchFile.config_path = nil
      SwitchFile.config_path.should == `pwd`.chomp + '/.switch_file'
    end

    it "should be the given config_path, if provided" do
      SwitchFile.config_path = 'spec/fixtures/project/.switch_file'
      SwitchFile.config_path.should be_a(Pow::Base)
      SwitchFile.config_path.to_s.should =~ /spec\/fixtures\/project\/.switch_file/
    end
  end

  describe ".config_path=" do
    it "should set the stored config_path to nil, if value is nil" do
      SwitchFile.config_path = nil
      SwitchFile.instance_variable_get(:@config_path).should be_nil
    end
  end

  describe ".file_type_attributes" do
    it "should be the set file_type_attributes, if available" do
      attribute_hash = {shortcut: :s}
      SwitchFile.file_type_attributes = [attribute_hash]
      SwitchFile.file_type_attributes.should == [attribute_hash]
    end

    it "should be the file_type_attributes from the config_path, if there are no set file_type_attributes" do
      SwitchFile.file_type_attributes = nil
      SwitchFile.config_path = Pow('spec/fixtures/project/.switch_file')
      SwitchFile.file_type_attributes.should be_an(Array)
    end
  end
end
