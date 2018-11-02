class ChangeDataTypeForInitEndDate < ActiveRecord::Migration[5.2]
  def change
    change_column :rents, :init_date, :date
    change_column :rents, :end_date, :date
  end
end
