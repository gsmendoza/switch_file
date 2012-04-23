require 'pry'
require 'switch_file'

RSpec.configure do |config|
  include SwitchFile

  config.before :each do
    SwitchFile.production = false
    test_tmp_dir.delete! if test_tmp_dir.exists?
    test_tmp_dir.create_directory
  end

  def test_tmp_dir
    Pow('tmp')
  end
end
