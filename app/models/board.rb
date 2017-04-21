class Board < ActiveRecord::Base
  belongs_to :admin
  has_many :companies
  has_many :listings
end
