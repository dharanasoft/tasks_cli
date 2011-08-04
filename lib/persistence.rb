require 'rubygems'
require 'active_support/all'
module Persistence
  def self.included(klass)
    klass.class_eval do
      @collection = []
      class << self
        attr_accessor :collection
      end
      extend ClassMethods
    end
  end
  module ClassMethods
    def yaml_file
      File.join(ENV['HOME'],"#{self.name.tableize}.yml")
    end
    def persist
      f=File.open(yaml_file,'w') do |f|
        f.write self.collection.to_yaml
        f.close
      end
    end
    def load
      yml_content=File.read(yaml_file)
      self.collection=YAML.load(yml_content)
    end
  end
end
