require 'spec_helper'

describe SwitchFile::App do
  describe "#execute" do
    it "should open the matching file_type of the source_path" do
      app = described_class.new
      app.invoke :execute, ["spec/fixtures/project/lib/project/sample.rb"], "shortcut" => 's', "config" => 'spec/fixtures/project/.switch_file'
      (test_tmp_dir / 'result.txt').read.chomp.should == 'spec/lib/project/sample_spec.rb'
    end
  end
end
