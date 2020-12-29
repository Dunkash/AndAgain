class CreateLines < ActiveRecord::Migration[6.0]
  def change
    create_table :lines do |t|
      t.references :graph, null: false, foreign_key: true
      t.string :x
      t.integer :y

      t.timestamps
    end
  end
end
