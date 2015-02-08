# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

u1 = User.create(:name => 'May', :password => 'chicken', :password_confirmation => 'chicken')
u2 = User.create(:name => 'Per', :password => 'chicken', :password_confirmation => 'chicken')
u3 = User.create(:name => 'Karrin', :password => 'chicken', :password_confirmation => 'chicken')