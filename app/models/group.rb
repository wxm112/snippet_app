# == Schema Information
#
# Table name: groups
#
#  id          :integer          not null, primary key
#  name        :string
#  created_at  :datetime
#  updated_at  :datetime
#  is_personal :boolean          default("false")
#

class Group < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :snippets
end
