require 'spec_helper'

describe SwitchFile::SourcePath do
  describe "#class_name" do
    it "should be the part of the value that is the class name of the source path" do
      FileType.all = [FileType.new(:path_regex => %r{lib/(.*).rb$})]

      source_path = SourcePath.new(:value => '/home/user/project/lib/project/some_class.rb')
      source_path.class_name.should == 'project/some_class'
    end
  end

  describe "#file_type" do
    it "should be the file type that matches the source path" do
      file_type = FileType.new(:path_regex => %r{lib/(.*).rb$})
      FileType.all = [file_type]

      source_path = SourcePath.new(:value => '/home/user/project/lib/project/some_class.rb')
      source_path.file_type.should == file_type
    end
  end

  describe "#prompt_message" do
    it "be the message to display if the user want to jump to file related to the source path" do
      FileType.all = [
        FileType.new(
          :name => :spec,
          :shortcut => :s,
          :open_command => lambda {|class_name| "geany spec/lib/#{class_name}_spec.rb"},
          :path_regex => %r{spec/lib/(.*)_spec.rb}
        ),
        FileType.new(
          :name => :lib,
          :shortcut => :l,
          :open_command => lambda {|class_name| "geany lib/#{class_name}.rb"},
          :path_regex => %r{lib/(.*).rb}
        )
      ]

      source_path = SourcePath.new(:value => '/home/user/project/lib/project/some_class.rb')
      source_path.prompt_message.should == "Enter the shortcut of the file you want to open:\n\n[s] spec: geany spec/lib/project/some_class_spec.rb\n[l] lib: geany lib/project/some_class.rb\n\n"
    end
  end
end
