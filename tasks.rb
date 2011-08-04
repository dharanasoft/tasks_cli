require 'yaml'

tasks = []

class Task
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
end

def get_tasks_by_tag(tasks,tag)
  tasks.find_all { |t| t[:tags].index(tag) }
end

def complete_tasks_by_tag(tasks,tag)
  get_tasks_by_tag(tasks,tag).map { |t| complete_task(t) }
end

def persist(tasks)
  f=File.open('tasks.yml','w')
  f.write tasks.to_yaml
  f.close
end

def load
  yml_content=File.read('tasks.yml')
  YAML.load(yml_content)
end

1.upto(10) do |i|
  t=Task.new("This is task #{i}")
  t.tag "tag1"
  t.tag "tag2" if (rand*2).round==1
  t.complete if (rand*2).round==1
  tasks << t
end

puts tasks
