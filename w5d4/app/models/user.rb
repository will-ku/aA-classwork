class User < ApplicationRecord

    has_many :enrollments,
        primary_key: :id,
        foreign_key: :student_id,
        class_name: :Enrollment

    #enrolled courses
    has_many :enrolled_courses,
        through: :enrollments,
        source: :course

end


# class Dog

#     has_many :toys,
#         primary_key: :id,
#         foreign_key: :dog_id,
#         class_name: :Toy

# end

# class Toys

#     belongs_to :dog,
#         primary_key: :id,
#         foreign_key: :dog_id,
#         class_name: :Dog

# end

# class House
#     has_many :toys,
#         through: :dogs,
#         source: :toys
# end

