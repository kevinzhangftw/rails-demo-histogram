class Student < ActiveRecord::Base
	has_many :enrolls
	self.primary_key = 'student_id'
end
