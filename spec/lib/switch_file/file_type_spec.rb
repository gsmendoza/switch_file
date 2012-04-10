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
      spec_file_type = FileType.new(:open_command => lambda{|class_name|
        "geany spec/lib/#{class_name}_spec.rb"
      })

      lib_file_type = FileType.new(:path_regex => %r{lib/(.*).rb$})

      FileType.all = [lib_file_type, spec_file_type]

      command = spec_file_type.generate_open_command(SourcePath.new(:value => '/home/user/project/lib/project/some_class.rb'))
      command.should == "geany spec/lib/project/some_class_spec.rb"
    end
  end
end
