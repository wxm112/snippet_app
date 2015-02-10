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
    has_and_belongs_to_many :snippets
    has_and_belongs_to_many :groups
    validates :name, :presence => true, :uniqueness => true
end
