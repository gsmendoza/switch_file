require 'spec_helper'

describe SwitchFile::FileType do
  describe "#all" do
    it "should be the set file types, if available" do
      file_type = FileType.new(:shortcut => :s)
      FileType.all = [file_type]
      FileType.all.should == [file_type]
    end

    it "should be the file types from the file_type_attributes, if there are no set file types" do
      FileType.all = nil

      SwitchFile.file_type_attributes = [{:shortcut => :s}]

      FileType.all.should have(1).file_type
      FileType.all[0].shortcut.should == :s
    end
  end

  describe "#generate_open_command" do
    it "should return the command for opening the desired file type of the source_path" do
      spec_file_type = FileType.new(
        :path_generator => lambda{|class_name| "spec/lib/#{class_name}_spec.rb" },
        :command => 'geany'
      )

      lib_file_type = FileType.new(
        :path_regex => %r{lib/(.*).rb$}
      )

      FileType.all = [lib_file_type, spec_file_type]

      command = spec_file_type.generate_open_command(SourcePath.new(:value => Pow('spec/fixtures/project/lib/some_class.rb').to_s))
      command.should == "geany #{Pow('spec/fixtures/project/spec/lib/some_class_spec.rb').to_s}"
    end
  end

  describe "#path" do
    it "should be the path of the matching file type of source_path" do
      spec_file_type = FileType.new(
        :path_generator => lambda{|class_name| "spec/lib/#{class_name}_spec.rb" },
        :command => 'geany'
      )

      lib_file_type = FileType.new(
        :path_regex => %r{lib/(.*).rb$}
      )

      FileType.all = [lib_file_type, spec_file_type]

      path = spec_file_type.path(SourcePath.new(:value => Pow('spec/fixtures/project/lib/some_class.rb').to_s))
      path.should == "spec/lib/some_class_spec.rb"
    end
  end
end
