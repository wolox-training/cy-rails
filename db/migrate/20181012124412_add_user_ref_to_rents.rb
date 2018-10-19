class AddUserRefToRents < ActiveRecord::Migration[5.2]
  def change
    add_reference :rents, :user, foreign_key: true
  end
end
