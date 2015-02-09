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
  belongs_to :user
end
