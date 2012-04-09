require 'spec_helper'

describe SwitchFile::App do
  describe "#execute" do
    it "should open the matching file_type of the source_path" do
      app = described_class.new
      app.invoke :execute, ["spec/fixtures/project/lib/sample.rb"], "shortcut" => 's', "config" => 'spec/fixtures/project/.switch_file'
      (test_tmp_dir / 'result.txt').read.should == 'spec/fixtures/project/lib/sample.rb'
    end
  end
end
