class Product < ApplicationRecord
    has_many :line_items
    has_many :carts, through: :line_items
    has_many :orders_products
    has_many :orders, through: :orders_products
    belongs_to :category
    has_one_attached :image
    
    validates :name, presence: true
    validates :price, presence: true, numericality: { greater_than: 0 }
    validates :description, presence: true 

    def self.ransackable_attributes(auth_object = nil)
        %w[id name description price quantity created_at updated_at]
    end
    
    def self.ransackable_associations(auth_object = nil)
        []
    end
    def self.search(keyword, category_id)
        products = self.all
        products = products.where('name LIKE ? OR description LIKE ?', "%#{keyword}%", "%#{keyword}%") if keyword.present?
        products = products.where(category_id: category_id) if category_id.present?
        products
      end
end
  