class Book < ActiveRecord::Base
	validates :title, presence: true
	validates :title, length: {minimum: 1}
	validates :description, presence: true
	validates :description, length: {minimum: 10}
	validates :url, presence: true
end
