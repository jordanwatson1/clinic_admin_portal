class TreatmentPlan < ApplicationRecord
  belongs_to :patient  # clinician
  belongs_to :user

  has_many :treatment_plan_exercises
  has_many :exercises, through: :treatment_plan_exercises
end
