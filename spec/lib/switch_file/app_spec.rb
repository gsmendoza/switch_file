require 'spec_helper'

describe SwitchFile::App do
  describe "#execute" do
    it "should open the matching file_type of the source_path" do
      app = described_class.new
      app.invoke :execute, ["spec/fixtures/project/lib/some_class.rb"], "shortcut" => 's'
      (test_tmp_dir / 'result.txt').read.chomp.should include('spec/lib/some_class_spec.rb')
    end
  end
end
