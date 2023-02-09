# == Schema Information
#
# Table name: enrollments
#
#  id         :bigint           not null, primary key
#  course_id  :bigint           not null
#  student_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Enrollment < ApplicationRecord
  validates :student_id, uniqueness: { scope: :course_id }

  belongs_to :student, #Find the n enrollment and show the student name and ID
             primary_key: :id,
             foreign_key: :student_id,
             class_name: :User

  belongs_to :course, #Find the n enrollment and show the course enrolled
             primary_key: :id,
             foreign_key: :course_id,
             class_name: :Course
end
