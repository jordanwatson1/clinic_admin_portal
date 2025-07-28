class Patient < ApplicationRecord
  has_many :appointments, dependent: :destroy
  belongs_to :user  # For multi-user support

  def full_name
    "#{first_name} #{last_name}"
  end
  
end
