class CreateTreatmentPlans < ActiveRecord::Migration[8.0]
  def change
    create_table :treatment_plans do |t|
      t.string :title
      t.text :notes
      t.references :patient, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
