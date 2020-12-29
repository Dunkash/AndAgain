class CreateUserGraphs < ActiveRecord::Migration[6.0]
  def change
    create_table :user_graphs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :graph, null: false, foreign_key: true
      t.boolean :waccess

      t.timestamps
    end
  end
end
