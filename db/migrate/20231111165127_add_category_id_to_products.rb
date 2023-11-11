class AddCategoryIdToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :category, foreign_key: true, null: true

    Product.update_all(category_id: Category.first.id) if Category.any?
  end
end
