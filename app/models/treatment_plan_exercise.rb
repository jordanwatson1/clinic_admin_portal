class TreatmentPlanExercise < ApplicationRecord
  belongs_to :treatment_plan
  belongs_to :exercise

  validates :sets, :reps, numericality: { only_integer: true, allow_nil: true }
end
