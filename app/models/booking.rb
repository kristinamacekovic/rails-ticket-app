class Booking < ApplicationRecord
    belongs_to :user
    belongs_to :ticket

    validates :card_number, presence: true, format: { with: /\A\d+\z/, message: "Only numbers allowed" }
    validates_length_of :card_number, :maximum => 16, :minimum => 16
end
