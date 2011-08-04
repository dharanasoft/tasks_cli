require './tasks'

if(ARGV.length==0)
  puts "You should give me a command"
  exit
end

class Controller
  def add(text)
    Task.load
    Task.parse(text)
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
end

c=Controller.new

command = ARGV.delete_at(0)
if(c.respond_to?(command))
  c.send(command,*ARGV)
end

