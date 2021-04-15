class Enrollment < ApplicationRecord

   has_many :students,
        primary_key: :id,
        foreign_key: :student_id,
        class_name: :Student

   has_many :courses,
        primary_key: :id,
        foreign_key: :course_id,
        class_name: :Course

end
