# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  password_digest :string
#  created_at      :datetime
#  updated_at      :datetime
#  is_admin        :boolean          default("false")
#

class User < ActiveRecord::Base
    has_secure_password # also needs password_digest column and bcrypt gem.
    has_many :snippets
    validates :name, :presence => true, :uniqueness => true
end
