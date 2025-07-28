class MakeUserIdNotNullOnPatients < ActiveRecord::Migration[8.0]
  def change
    change_column_null :patients, :user_id, false
  end
end
