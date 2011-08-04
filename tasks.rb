$:.unshift(".")
require 'yaml'
require 'persistence'
class Task
  include Persistence
  @@collection= []

  attr_accessor :title, :status, :tags
  def initialize(title)
    @title=title
    @tags = []
  end
  def complete
    @status=:completed
    self
  end
  def tag(tag_name)
    @tags ||= []
    @tags << tag_name
    self
  end

  def to_hashtags
    @tags.map {|t| "##{t}" }.join(" ")
  end
  def to_s
    "#{'[done]' if status==:completed} #{title} #{to_hashtags}"
  end

  def self.by_tag(tag)
    @@collection.find_all { |t| t.tags.index(tag) }
  end
  def self.complete_by_tag(tag)
    by_tag(tag).map { |t| t.complete }
  end
end


Task.load
puts Task.collection
