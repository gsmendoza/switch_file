require 'spec_helper'

describe SwitchFile::Exception do
  describe "#message" do
    it "should include the class name of the exception" do
      described_class.new('hello').message.should == 'Exception: hello'
    end
  end
end
