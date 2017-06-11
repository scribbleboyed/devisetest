class Employer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
include ImageUploader::Attachment.new(:image)
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company
  belongs_to :board
  has_many :listings
  has_many :credits

  def apply_credits(num_of_credits)
    credits = []

    num_of_credits.times do
      credits << Credit.new(employer: self)
    end

    Credit.import credits
  end

  def available_credits
    credits.unclaimed
  end
end
