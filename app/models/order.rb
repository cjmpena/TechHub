class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :province
  
  def calculate_taxes
    case self.customer.province.name
    when 'Alberta', 'Northwest Territories', 'Nunavut', 'Yukon'
      self.tax = self.total * 0.05 # 5% GST
    when 'Manitoba', 'British Columbia'
      self.tax = self.total * 0.12 # 12% GST + PST
    when 'Saskatchewan'
      self.tax = self.total * 0.11 # 11% GST + PST
    when 'New Brunswick', 'Newfoundland and Labrador', 'Nova Scotia', 'Prince Edward Island'
      self.tax = self.total * 0.15 # 15% HST
    when 'Quebec'
      self.tax = self.total * 0.14975 # 14.975% GST + QST
    when 'Ontario'
      self.tax = self.total * 0.13 # 13% HST
    else
      self.tax = 0 # No tax for other provinces
    end
    self.total += self.tax
   end    
end
