class Chapter < ApplicationRecord
	belongs_to :user
	belongs_to :novel
	has_many :comments
	validates :chap, presence: true,  numericality: { only_integer: true }
	validates :name, presence: true, length: { minimum: 3, maximum: 25 }
	validates :content, presence: true, length: { minimum: 3 }
end
