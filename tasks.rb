require 'psych'

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

  def self.parse(text)
    pos = (text=~/#\w+/)
    if(pos)
      t=Task.new(text.slice(0,pos-1))
      tags=text.scan(/#\w+/)
      tags =tags.map { |t| t.reverse.chop.reverse }
      tags.each do |tn|
        t.tag tn
      end
      t
    else
      Task.new(text)
    end
  end

  def self.create(text)
    self.collection << self.parse(text)
  end

  def self.by_tag(tag)
    @@collection.find_all { |t| t.tags.index(tag) }
  end
  def self.complete_by_tag(tag)
    by_tag(tag).map { |t| t.complete }
  end
  def self.clear!
    self.collection = []
    self.persist
  end
  def self.show
    0.upto(self.collection.length-1) do |i|
      puts "##{i} #{self.collection[i]}"
    end
  end
end

