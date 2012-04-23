require 'spec_helper'

describe SwitchFile do
  describe "#production?" do
    it "should be true by default" do
      SwitchFile.production = nil
      SwitchFile.production?.should be_true
    end

    it "should be false when testing" do
      SwitchFile.production?.should be_false
    end
  end
end
