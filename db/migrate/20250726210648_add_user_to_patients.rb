class AddUserToPatients < ActiveRecord::Migration[8.0]
  def change
    add_reference :patients, :user, foreign_key: true
  end
end
