class ApplicationRecord < ActiveRecord::Base
	self.abstract_class = true
	validates :name, presence: true
	validates :name, length: { minimum: 2, maximum: 20 }

end
