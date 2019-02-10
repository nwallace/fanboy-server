class CreateTournaments < ActiveRecord::Migration[5.2]
  def change
    create_table :tournaments do |t|
      t.references :title, null: false, index: true
      t.string :name, null: false
      t.date :starts, null: false
      t.date :ends
      t.string :logo_uri
      t.timestamps
    end

    add_index :tournaments, [:title_id, :starts]
    add_foreign_key :tournaments, :titles
  end
end
