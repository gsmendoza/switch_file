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
      lambda { app.invoke :execute, [], "path" => "spec/fixtures/project/lib/some_class.rb", "shortcut" => "\n" }.should_not raise_error
    end

    it "should not fail if the shortcut is invalid" do
      app = described_class.new
      lambda { app.invoke :execute, [], "path" => "spec/fixtures/project/lib/some_class.rb", "shortcut" => "z" }.should_not raise_error
    end

    it "should fail if the path does not have a matching file type" do
      app = described_class.new
      lambda { app.invoke :execute, [], "path" => "spec/fixtures/project/Gemfile" }.should_not raise_error
    end
  end
end
