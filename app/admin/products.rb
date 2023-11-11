ActiveAdmin.register Product do
    permit_params :name, :price, :description

    index do
        selectable_column
        id_column
        column :name
        column :price
        column :description
        actions
    end
    
    filter :name
    filter :price

end