require 'spec_helper'

describe SwitchFile do
  describe ".config_path" do
    it "should be the .switch_file in the present working directory, by default" do
      SwitchFile.config_path.should == `pwd`.chomp + '/.switch_file'
    end

    it "should be the given config_path, if provided" do
      SwitchFile.config_path = 'spec/fixtures/project/.switch_file'
      SwitchFile.config_path.to_s.should =~ /spec\/fixtures\/project\/.switch_file/
    end
  end
end
