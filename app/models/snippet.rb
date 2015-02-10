# == Schema Information
#
# Table name: snippets
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  content    :text
#

class Snippet < ActiveRecord::Base
  has_and_belongs_to_many :groups
  has_many :users, :through => :groups
end
