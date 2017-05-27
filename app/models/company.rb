class Company < ActiveRecord::Base
  belongs_to :board
  has_many :employers
  has_many :listings
end
