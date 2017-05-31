class Listing < ActiveRecord::Base
  belongs_to :board
  belongs_to :employer
  belongs_to :company
  geocoded_by :job_location
  after_validation :geocode, if: :job_location_changed?
end
