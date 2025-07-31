class TreatmentPlanExercise < ApplicationRecord
  belongs_to :treatment_plan
  belongs_to :exercise

  validates :exercise, presence: true
  validates :sets, :reps, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
end
