class AddConfirmableToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sign_in_count, :integer, :default => 0, :null => false
    add_column :users, :current_sign_in_at, :datetime
    add_column :users, :last_sign_in_at, :string
    add_column :users, :last_sign_in_ip, :string
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :unconfirmed_email, :string
  end
end
