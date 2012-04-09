require 'pow'
require 'thor'

require "switch_file/version"
require 'switch_file/app'


module SwitchFile
  def self.config_path
    @config_path || (Pow(Dir.pwd) / '.switch_file')
  end

  def self.config_path=(value)
    @config_path = Pow(value)
  end

end