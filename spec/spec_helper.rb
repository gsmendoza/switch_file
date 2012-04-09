require 'pry'
require 'switch_file'

RSpec.configure do |config|
  include SwitchFile

  config.before :each do
    test_tmp_dir.delete! if test_tmp_dir.exists?
    test_tmp_dir.create_directory
    SwitchFile.config_path = Pow('spec/fixtures/project/.switch_file')
    SwitchFile.file_type_attributes = nil
    FileType.all = nil
  end

  def test_tmp_dir
    Pow('tmp')
  end
end
