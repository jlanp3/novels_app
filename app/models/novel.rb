class Novel < ApplicationRecord
	has_many :chapters, dependent: :destroy
	has_many :users, through: :chapters
	validates :name, presence: true, length: { minimum: 3, maximum: 25 }
end
