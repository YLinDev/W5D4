# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string           not null
#  prereq_id     :bigint
#  instructor_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord
  validates :name, :instructor_id, presence: true

    has_many :enrollments, #show the all enrollments with this course id
            primary_key: :id,
            foreign_key: :course_id,
            class_name: :Enrollment

    has_many :enrolled_students, #show all the students in the course
           through: :enrollments,
           source: :student


end
