# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


Language.create([{ :name => 'Spanish'},{ :name => 'French'},{ :name => 'Hindi'},{ :name => 'English'},]) unless Language.all.size > 0

User.create([{ :fname => 'Sandro', :lname => 'Padin', :phone_number => '7732200740', :email => 'sandropadin@gmail.com', :company => "ACME"}]) if User.where(:fname => 'Sandro').empty?
User.create([{ :fname => 'Agam', :lname => 'Patel', :phone_number => '7349450912', :email => 'agamrp@gmail.com', :company => "ACME"}]) if User.where(:fname => 'Agam').empty?
User.create([{ :fname => 'Jason', :lname => 'McCreary', :phone_number => '', :email => '', :company => "ACME"}]) if User.where(:fname => 'Agam').empty?


User.first.languages << Language.where(:name => 'Spanish').first
User.first.save!

Conference.create(:title => "APIHACKDAY")