ActiveAdmin.register Book do
  permit_params :genre, :title, :author, :publisher, :year, :description
  index do
    selectable_column
    id_column
    column :genre
    column :title
    column :author
    column :publisher
    column :year
    column :created_at
    column :updated_at
    actions
  end
  filter :title
  filter :genre
  filter :author
  filter :year
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :genre
      f.input :title
      f.input :author
      f.input :publisher
      f.input :year
      f.input :description
    end
    f.actions
  end
end
