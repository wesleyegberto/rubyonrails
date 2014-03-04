class Person < ActiveRecord::Base
	#the attributes are mapped in ActiveRecord automatically
	validates :name, presence: true, length: {minimum:5,maximum:50}
	validates :age, presence: true, numericality: true
end
