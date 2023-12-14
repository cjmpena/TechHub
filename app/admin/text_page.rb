ActiveAdmin.register TextPage do
    permit_params :title, :content
  
    form do |f|
      f.inputs 'Text Page Details' do
        f.input :title
        f.input :content, as: :text
      end
      f.actions
    end
end
  