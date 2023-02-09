# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  validates :name, presence: true

  has_many :enrollments, #Show the n Users enrollment 
           class_name: :Enrollment,
           primary_key: :id,
           foreign_key: :student_id

  has_many :enrolled_courses, #Show the n Users courses
           through: :enrollments,
           source: :course
end
