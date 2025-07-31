class Exercise < ApplicationRecord
  belongs_to :user
  has_one_attached :media

  has_many :treatment_plan_exercises
  has_many :treatment_plans, through: :treatment_plan_exercises

  validates :title, presence: true
end
