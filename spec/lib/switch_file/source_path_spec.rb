require 'spec_helper'

describe SwitchFile::SourcePath do
  describe "#class_name" do
    it "should be the part of the value that is the class name of the source path" do
      source_path = SourcePath.new(:value => 'spec/fixtures/project/lib/project/some_class.rb')
      source_path.project.should_receive(:file_types).and_return([FileType.new(:path_regex => %r{lib/(.*).rb$})])
      source_path.class_name.should == 'project/some_class'
    end
  end

  describe "#file_type" do
    it "should be the file type that matches the source path" do
      file_type = FileType.new(:path_regex => %r{lib/(.*).rb$})

      source_path = SourcePath.new(:value => 'spec/fixtures/project/lib/some_class.rb')
      source_path.project.should_receive(:file_types).and_return([file_type])
      source_path.file_type.should == file_type
    end
  end

  describe "#prompt_message" do
    it "be the message to display if the user want to jump to file related to the source path" do
      file_types = [
        FileType.new(
          :name => :spec,
          :shortcut => :s,
          :path_generator => lambda {|class_name| "spec/lib/#{class_name}_spec.rb"},
          :path_regex => %r{spec/lib/(.*)_spec.rb},
          :command => 'geany'
        ),
        FileType.new(
          :name => :lib,
          :shortcut => :l,
          :path_generator => lambda {|class_name| "lib/#{class_name}.rb"},
          :path_regex => %r{lib/(.*).rb},
          :command => 'geany'
        )
      ]

      source_path = SourcePath.new(:value => Pow('spec/fixtures/project/lib/some_class.rb').to_s)
      source_path.project.stub(:file_types).and_return(file_types)
      source_path.prompt_message.should == "Enter the shortcut of the file you want to open:\n\n[s] spec: spec/lib/some_class_spec.rb\n[l] lib: lib/some_class.rb\n\n"
    end
  end

  describe ".project_path" do
    it "should be the ancestor of path that has a .switch_file file" do
      SourcePath.project_path(Pow('spec/fixtures/project/lib/some_class.rb').to_s).should == Pow('spec/fixtures/project').to_s
    end

    it "should raise an error if the path does not have a project_path" do
      lambda { SourcePath.project_path(Pow('/').to_s) }.should raise_error(SourcePath::CannotFindProjectPath)
    end
  end

  describe "project" do
    it "should be the project which owns this source_path" do
      source_path = SourcePath.new(:value => 'spec/fixtures/project/lib/some_class.rb')
      source_path.project.should be_a(Project)
      source_path.project.path.should == Pow('spec/fixtures/project').to_s
    end
  end
end
