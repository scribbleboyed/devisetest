class Listing < ActiveRecord::Base
  belongs_to :board
  belongs_to :employer
  belongs_to :company
end
