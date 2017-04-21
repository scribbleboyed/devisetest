class Company < ActiveRecord::Base
  belongs_to :board
  belongs_to :employer
  has_many :listings
end
