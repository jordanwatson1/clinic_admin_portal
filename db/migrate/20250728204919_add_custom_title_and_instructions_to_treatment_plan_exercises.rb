class AddCustomTitleAndInstructionsToTreatmentPlanExercises < ActiveRecord::Migration[8.0]
  def change
    add_column :treatment_plan_exercises, :custom_title, :string
  end
end
