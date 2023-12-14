class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :province
  has_many :orders_products
  has_many :products, through: :orders_products

  before_save :calculate_taxes

  def calculate_taxes
    return unless self.province.present?

    original_total = self.total
    self.tax = original_total * self.province.tax_rate
    self.total += self.tax
  end
end
