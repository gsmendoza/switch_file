require 'spec_helper'

describe SwitchFile::App do
  describe "#execute" do
    it "should open the matching file_type of the source" do
      app = described_class.new
      app.invoke :execute, [], "path" => "spec/fixtures/project/lib/some_class.rb", "shortcut" => 's'
      (test_tmp_dir / 'result.txt').read.chomp.should include('spec/lib/some_class_spec.rb')
    end

    it "should exit if the shortcut is blank" do
      app = described_class.new
      app.invoke :execute, [], "path" => "spec/fixtures/project/lib/some_class.rb", "shortcut" => "\n"
      (test_tmp_dir / 'result.txt').should_not exist
    end

    it "should not fail if the shortcut is invalid" do
      app = described_class.new
      app.invoke :execute, [], "path" => "spec/fixtures/project/lib/some_class.rb", "shortcut" => "z"
      (test_tmp_dir / 'result.txt').should_not exist
    end
  end
end
