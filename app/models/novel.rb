class Novel < ApplicationRecord
	has_many :chapters
	has_many :users, through: :chapters
end
