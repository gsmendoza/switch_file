require 'pow'
require 'thor'
require 'valuable'

require 'switch_file/app'
require 'switch_file/file_type'
require 'switch_file/file_type_shortcut'
require 'switch_file/source_path'
require "switch_file/version"

module SwitchFile
  def self.config_path
    @config_path || (Pow(Dir.pwd) / '.switch_file')
  end

  def self.config_path=(value)
    @config_path = value
  end

  def self.file_type_attributes=(attributes_array)
    @file_type_attributes = attributes_array
  end

  def self.file_type_attributes
    @file_type_attributes || eval(config_path.read)
  end
end