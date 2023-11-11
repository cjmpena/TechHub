class Product < ApplicationRecord
    validates :name, presence: true
    validates :price, presence: true, numericality: { greater_than: 0 }
    validates :description, presence: true 

    def self.ransackable_attributes(auth_object = nil)
        %w[id name description price quantity created_at updated_at]
    end
    
    def self.ransackable_associations(auth_object = nil)
        []
    end
end
  