# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

case Rails.env
when "development"
  Student.create( student_id:	"100134", name:	"bobby", email: "bobbyc@sfu.ca" )
  Student.create( student_id:	"100000",	name:	"kai", email: "kwz@sfu.ca" )
  Course.create(name:	"cmpt276",	description:"software eng")
  Enroll.create(student_id:"100000", course_id:"1", percentage: 53.4, lettergrade:"C-")
  Enroll.create(student_id:"100134", course_id:"1", percentage: 93.4, lettergrade:"A-")
end
