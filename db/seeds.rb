# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
mails = ["abc123@gmail.com","def123@gmail.com" ,"ghi123@gmail.com" , "jkl123@gmail.com"]
mails.each do |i|
  generated_password = Devise.friendly_token.first(8)
  user = User.create!(email: i, password: generated_password)	
  lists = List.create([{title: 'Completed Tasks', description: 'List of tasks completed'},{title: 'Pending Tasks', description: 'List of tasks pending'}])
  user.lists  = lists
  user.save
end