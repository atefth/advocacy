class CaseFile < ApplicationRecord
	belongs_to :advocate
	belongs_to :client
	enum status: [:Running, :Closed]

	scope :active, -> {where(status: :Running)}
	scope :completed, -> { where("convocation_on < ?", Date.today) }
	scope :upcoming, -> { where("convocation_on > ?", Date.today) }
	

	def self.search(search)
	  where("name LIKE ?", "%#{search}%") or
	  where("file_received_on LIKE ?", "%#{search}%") or
	  where("appeal_on LIKE ?", "%#{search}%") or
	  where("convocation_on LIKE ?", "%#{search}%") or
	  where("amount_paid LIKE ?", "%#{search}%") or
	  where("status LIKE ?", "%#{search}%")
	end
end
