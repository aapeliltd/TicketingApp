class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys do |t|
      t.text :comment
      t.integer :rating
      t.references :ticket, index: true, foreign_key: {to_table: :tickets}
      t.timestamps
    end
  end
end
