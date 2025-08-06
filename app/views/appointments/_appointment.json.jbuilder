json.extract! appointment, :id, :patient_id, :start_time, :end_time, :notes, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
