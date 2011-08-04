tasks = []

1.upto(10) do |i|
  t={:title=>"This is task #{i}"}
  t[:status]="completed" if (rand*2).round==1
  t[:tags]||=[]
  t[:tags] << "tag1"
  t[:tags] << "tag2" if (rand*2).round==1
  tasks << t
end

puts tasks
