class Restaurant < ActiveRecord::Base
  # has_secure_password

  has_and_belongs_to_many :categories
  has_many :reservations
  has_many :reviews
  belongs_to :owner, :class_name => "Customer"
end
