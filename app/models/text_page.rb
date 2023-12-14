class TextPage < ApplicationRecord
    validates :title, presence: true

    def self.ransackable_attributes(auth_object = nil)
        ["title", "content"] 
    end
end
  