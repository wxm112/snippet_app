# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  name              :string
#  password_digest   :string
#  created_at        :datetime
#  updated_at        :datetime
#  email             :string
#  confirmation_code :string
#  confirmed         :boolean          default("false")
#

class User < ActiveRecord::Base
    has_secure_password # also needs password_digest column and bcrypt gem.
    has_many :snippets, :through => :groups
    has_and_belongs_to_many :groups
    validates :name, :presence => true, :uniqueness => true 
    validates :email, :presence => true, :uniqueness => true, :email_format => { message: "doesn't look like an email address" }
end
