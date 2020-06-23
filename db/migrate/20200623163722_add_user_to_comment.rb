class AddUserToComment < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments,:user, index: true, foreign_key: {to_table: :users}
  end
end
