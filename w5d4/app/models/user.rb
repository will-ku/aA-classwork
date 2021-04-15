# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord

    has_many :enrollments,
        primary_key: :id,
        foreign_key: :student_id,
        class_name: :Enrollment

    has_many :enrolled_courses,
        through: :enrollments,
        source: :course

    has_many :instructor,
        primary_key: :id,
        foreign_key: :instructor_id,
        class_name: :Course
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

