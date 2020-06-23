class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.boolean :is_agent_comment
      t.references :ticket, index: true, foreign_key: {to_table: :tickets}
      t.timestamps
    end
  end
end
