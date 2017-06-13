class Company < ActiveRecord::Base
  # include ImageUploader[:image]
  include ImageUploader::Attachment.new(:image)
  belongs_to :board
  belongs_to :employer
  has_many :listings
end
