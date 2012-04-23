require "active_support/inflector"
require 'pow'
require 'thor'
require 'valuable'

require 'switch_file/app'
require 'switch_file/exception'
require 'switch_file/file_type'
require 'switch_file/project'
require 'switch_file/source'
require "switch_file/version"

module SwitchFile
  def self.production?
    @production.nil? ? true : @production
  end

  def self.production=(value)
    @production = value
  end
end

