class Credit < ActiveRecord::Base
  belongs_to :employer
  belongs_to :listing

  scope :unclaimed, -> { where(claimed_on: nil) }

  def claimed
    claimed_on.present?
  end
end
