class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :body
      t.string :ticket_no
      t.boolean :is_close
      t.references :user, index: true, foreign_key: {to_table: :users}
      t.references :survey, index: true, foreign_key: {to_table: :surveys}
      t.timestamps
    end
  end
end
