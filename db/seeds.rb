# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Snippet.destroy_all
Group.destroy_all

u1 = User.create(:name => 'May', :password => 'chicken', :password_confirmation => 'chicken')
u2 = User.create(:name => 'Per', :password => 'chicken', :password_confirmation => 'chicken')
u3 = User.create(:name => 'Karrin', :password => 'chicken', :password_confirmation => 'chicken')
u4 = User.create(:name => 'Bruno', :password => 'chicken', :password_confirmation => 'chicken')

s1 = Snippet.create(:name => 'calendar', :content => 'Baby meeting on 23/03/2015')
s2 = Snippet.create(:name => 'event', :content => 'Baby meeting')
s3 = Snippet.create(:name => 'news', :content => 'Baby is dur on 08/08/2015')
s4 = Snippet.create(:name => 'activity', :content => 'Prepare for the new baby')

g1 = Group.create(:name => 'AMA')
g2 = Group.create(:name => 'CBC')
g3 = Group.create(:name => 'GA')
g4 = Group.create(:name => 'May', :is_personal => true)
g5 = Group.create(:name => 'Per', :is_personal => true)
g6 = Group.create(:name => 'Karrin', :is_personal => true)
g7 = Group.create(:name => 'Bruno', :is_personal => true)


# Associate users and groups:
u1.groups << g4 << g1
u2.groups << g5 << g2
u3.groups << g6 << g3
u4.groups << g7 << g3

# Associate groups and snippets:
g1.snippets << s1 
g2.snippets << s2
g3.snippets << s3
g4.snippets << s4
g5.snippets << s2
g6.snippets << s3
g7.snippets << s4






