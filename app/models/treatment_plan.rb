class TreatmentPlan < ApplicationRecord
  belongs_to :patient  # clinician
  belongs_to :user

  has_many :treatment_plan_exercises, dependent: :destroy
  has_many :exercises, through: :treatment_plan_exercises

  accepts_nested_attributes_for :treatment_plan_exercises, allow_destroy: true
end
