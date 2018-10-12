class CreateRents < ActiveRecord::Migration[5.2]
  def change
    create_table :rents do |t|
      t.datetime :init_date, null: false
      t.datetime :end_date, null: false

      t.timestamps
    end
  end
end
