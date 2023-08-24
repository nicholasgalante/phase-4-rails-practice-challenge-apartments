class Lease < ApplicationRecord
   belongs_to :tenant 
   belongs_to :apartment

   validates :rent, presence: true
   validates :rent, numericality: true
end
