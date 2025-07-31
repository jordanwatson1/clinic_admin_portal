json.extract! treatment_plan_exercise, :id, :treatment_plan_id, :exercise_id, :sets, :reps, :instructions, :created_at, :updated_at
json.url treatment_plan_exercise_url(treatment_plan_exercise, format: :json)
