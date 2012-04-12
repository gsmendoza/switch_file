require 'spec_helper'

describe SwitchFile::FileType do
  describe "#generate_open_command" do
    it "should return the command for opening the desired file type of the source" do
      spec_file_type = FileType.new(
        :path_generator => lambda{|class_name| "spec/lib/#{class_name}_spec.rb" },
        :command => 'geany'
      )

      lib_file_type = FileType.new(
        :path_regex => %r{lib/(.*).rb$}
      )

      source = Source.new(:path => Pow('spec/fixtures/project/lib/some_class.rb').to_s)
      source.project.should_receive(:file_types).and_return([lib_file_type, spec_file_type])

      command = spec_file_type.generate_open_command(source)
      command.should == "geany #{Pow('spec/fixtures/project/spec/lib/some_class_spec.rb').to_s}"
    end
  end

  describe "#path" do
    it "should be the path of the matching file type of source" do
      spec_file_type = FileType.new(
        :path_generator => lambda{|class_name| "spec/lib/#{class_name}_spec.rb" },
        :command => 'geany'
      )

      path = spec_file_type.relative_path(Source.new(:path => Pow('spec/fixtures/project/lib/some_class.rb').to_s))
      path.should == "spec/lib/some_class_spec.rb"
    end
  end
end
