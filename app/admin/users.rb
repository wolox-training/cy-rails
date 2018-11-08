ActiveAdmin.register User do
  permit_params :first_name, :last_name, :email, :locale
  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :uid
    column :locale
    column :created_at
    column :updated_at
    actions
  end

  filter :first_name
  filter :last_name
  filter :email
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :locale
    end
    f.actions
  end
end
