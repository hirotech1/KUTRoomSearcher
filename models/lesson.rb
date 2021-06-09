class Lesson < ApplicationRecord
  validates :lesson_name, presence: true
  validates :teacher_name , presence: true
  validates :teacher_room , presence: true
end
