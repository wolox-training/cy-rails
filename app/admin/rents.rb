ActiveAdmin.register Rent do
  permit_params :init_date, :end_date, :book_id, :user_id
  index do
    selectable_column
    id_column
    column :init_date
    column :end_date
    column :book
    column :user
    column :created_at
    column :updated_at
    actions
  end

  filter :init_date
  filter :end_date
  filter :book
  filter :user
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :init_date
      f.input :end_date
      f.input :book_id, as: :select, collection: Book.name_books
      f.input :user_id, as: :select, collection: User.name_users
    end
    f.actions
  end
end
