class Enrollment < ActiveRecord::Base
  belongs_to(
    :students,
    foreign_key: :student_id,
    primary_key: :id,
    class_name: 'User'
  )
  belongs_to(
    :courses,
    foreign_key: :course_id,
    primary_key: :id,
    class_name: 'Course'
  )
end
