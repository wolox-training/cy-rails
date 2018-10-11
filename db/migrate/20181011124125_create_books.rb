class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :genero, null: false
      t.string :autor, null: false
      t.string :image, null: false
      t.string :titulo, null: false
      t.string :editor, null: false
      t.string :anio, null: false

      t.timestamps
    end
  end
end
