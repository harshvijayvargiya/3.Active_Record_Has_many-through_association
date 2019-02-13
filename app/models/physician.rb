class Physician < ApplicationRecord
  has_many :appointments
  has_many :patient, :through => :appointments

  validates :name, presence: true,
                    length: { minimum: 10 }
end
