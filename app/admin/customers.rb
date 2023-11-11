ActiveAdmin.register Customer do
    permit_params :first_name, :last_name, :email, :phone, :address, :password, :password_confirmation
  
    index do
      selectable_column
      id_column
      column :first_name
      column :last_name
      column :email
      column :phone
      column :address
      actions
    end
  
    filter :first_name
    filter :last_name
    filter :email
    filter :phone
    filter :address
  
    form do |f|
      f.inputs 'Customer Details' do
        f.input :first_name
        f.input :last_name
        f.input :email
        f.input :phone
        f.input :address
        f.input :password
        f.input :password_confirmation
      end
      f.actions
    end
  end
  