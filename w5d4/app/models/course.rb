class Course < ApplicationRecord

    belongs_to :enrollment,
        primary_key: :id,
        foreign_key: :course_id,
        class_name: :Enrollment
end
