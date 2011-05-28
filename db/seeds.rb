# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


Language.create([{ :name => 'Spanish'},{ :name => 'French'},{ :name => 'Hindi'},{ :name => 'English'},]) unless Language.all.size > 0

user = User.create([{ :fname => 'John', :lname => 'Doe', :phone_number => '3121234567', :company => 'ACME'}])
user.first.languages << Language.where(:name => 'Spanish').first
user.first.save!