class Patient < ApplicationRecord
has_many :appointments
has_many :physician, :through => :appointments, dependent: :destroy

validates :name, presence: true,
                    length: { minimum: 10 }
end
