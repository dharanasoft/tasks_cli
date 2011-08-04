tasks = []

def new_task(title)
  {:title=>title}
end

def complete_task(task)
  task[:status]=:completed
end

def tag_task(task,tag)
  task[:tags] ||= []
  task[:tags] << tag
end

1.upto(10) do |i|
  t=new_task("This is task #{i}")
  complete_task(t) if (rand*2).round==1
  tag_task(t,"tag1")
  tag_task(t,"tag2") if (rand*2).round==1
  tasks << t
end

puts tasks
