class Info < ApplicationRecord
	default_scope -> { order(created_at: :desc) }

	has_many :pictures, dependent: :destroy
	
	validates :title, presence: true
	validates :content, presence: true
end
