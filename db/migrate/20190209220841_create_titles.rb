class CreateTitles < ActiveRecord::Migration[5.2]
  def change
    create_table :titles do |t|
      t.string :name, null: false
      t.string :nickname, null: false
      t.string :slug, null: false, index: true
      t.string :developer, null: false
      t.integer :priority, null: false
      t.timestamps
    end
  end
end
