class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def self.ransackable_attributes(auth_object = nil)
    %w[id first_name last_name email phone address created_at updated_at]
  end
end
