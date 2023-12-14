ActiveAdmin.register Product do
  permit_params :name, :price, :description, :category_id, :image

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :description
    column 'Category' do |product|
      product.category.name if product.category
    end
    column 'Image' do |product|
      if product.image.attached?
        image_tag product.image.url, height: '50'
      else
        'No Image'
      end
    end
    actions
  end

  filter :name
  filter :price

  form do |f|
    f.inputs 'Product Details' do
      f.input :name
      f.input :price, min: 0
      f.input :description
      f.input :category
      f.input :image, as: :file
    end
    f.actions
  end
end
