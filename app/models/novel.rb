class Novel < ApplicationRecord
	has_many :chapters, dependent: :destroy
	has_many :users, through: :chapters
	accepts_nested_attributes_for :chapters
	validates :name, presence: true, length: { minimum: 3, maximum: 25 }, uniqueness: true
end
