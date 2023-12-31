class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # Allows for data to display and add on the customer tab  
  def self.ransackable_attributes(auth_object = nil)
    %w[id first_name last_name email phone address created_at updated_at]
  end
end
