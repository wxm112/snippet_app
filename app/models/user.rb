# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  password_digest :string
#  created_at      :datetime
#  updated_at      :datetime
#  email           :string
#

class User < ActiveRecord::Base
    has_secure_password # also needs password_digest column and bcrypt gem.
    has_many :snippets, :through => :groups
    has_and_belongs_to_many :groups
    validates :name, :presence => true, :uniqueness => true
end
