class Info < ApplicationRecord
	default_scope -> { order(created_at: :desc) }
	validates :title, presence: true
	validates :content, presence: true
end
