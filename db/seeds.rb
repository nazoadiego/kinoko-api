# To repopulate run rails db:seed:replant

puts "A farmer has appeared to populate your db"

label_one = FactoryBot.create(:label)
label_two = FactoryBot.create(:label, title: 'Read')
task = FactoryBot.create(:task, labels: [label_one, label_two])
FactoryBot.create(:work_session, task: task)
FactoryBot.create(:work_session, task: task)

puts "."
puts " ."
puts "  ."
puts " ."
puts "."
puts "....."
puts "Seeds have been planted. The farmer dissapears into the sunset"
