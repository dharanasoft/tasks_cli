require './tasks'

if(ARGV.length==0)
  puts "You should give me a command"
  exit
end

class Controller
  def add(text)
    Task.load
    Task.create(text)
    Task.persist
    show
  end
  def show
    Task.load
    Task.show
  end
  def clear
    Task.clear!
    puts "Cleared! The collection now has #{Task.collection.length} items"
  end
  def complete(index)
    Task.load
    t=Task.collection[index.to_i]
    t.complete
    Task.persist
    show
  end
  def edit(index,text)
    Task.load
    t=Task.parse(text)
    Task.collection[index.to_i]=t
    Task.persist
    show
  end
  def delete(index)
    Task.load
    Task.collection.delete_at(index.to_i)
    Task.persist
    show
  end
end

c=Controller.new

command = ARGV.delete_at(0)
if(c.respond_to?(command))
  c.send(command,*ARGV)
else
  puts "Invalid command"
end

