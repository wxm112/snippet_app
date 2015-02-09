# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Snippet.destroy_all

u1 = User.create(:name => 'May', :password => 'chicken', :password_confirmation => 'chicken')
u2 = User.create(:name => 'Per', :password => 'chicken', :password_confirmation => 'chicken')
u3 = User.create(:name => 'Karrin', :password => 'chicken', :password_confirmation => 'chicken')

s1 = Snippet.create(:name => 'calendar', :content => 'Baby meeting on 23/03/2015')
s2 = Snippet.create(:name => 'event', :content => 'Baby meeting')
s3 = Snippet.create(:name => 'news', :content => 'Baby is dur on 08/08/2015')
s4 = Snippet.create(:name => 'activity', :content => 'Prepare for the new baby')

u1.snippets << s1 << s4
u2.snippets << s2
u3.snippets << s3

