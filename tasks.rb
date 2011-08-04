require 'yaml'

tasks = []

def new_task(title)
  {:title=>title}
end

def complete_task(task)
  task[:status]=:completed
  task
end

def tag_task(task,tag)
  task[:tags] ||= []
  task[:tags] << tag
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

#1.upto(10) do |i|
  #t=new_task("This is task #{i}")
  #complete_task(t) if (rand*2).round==1
  #tag_task(t,"tag1")
  #tag_task(t,"tag2") if (rand*2).round==1
  #tasks << t
#end

tasks = load
puts tasks

