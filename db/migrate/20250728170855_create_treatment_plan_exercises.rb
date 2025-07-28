class CreateTreatmentPlanExercises < ActiveRecord::Migration[8.0]
  def change
    create_table :treatment_plan_exercises do |t|
      t.references :treatment_plan, null: false, foreign_key: true
      t.references :exercise, null: false, foreign_key: true
      t.integer :sets
      t.integer :reps
      t.text :instructions

      t.timestamps
    end
  end
end
