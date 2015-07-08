class Course < ActiveRecord::Base
  has_many(
    :enrollments,
    foreign_key: :course_id,
    primary_key: :id,
    class_name: "Enrollment"
  )
  has_many :enrolled_students, through: :enrollments, source: :students
end
