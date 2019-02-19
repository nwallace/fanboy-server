class CreateRoundsMatchesAndGames < ActiveRecord::Migration[5.2]

  def change
    create_table :competitors do |t|
      t.references :title, null: false
      t.string :name, null: false
      t.string :logo_uri
      t.timestamps
    end
    add_foreign_key :competitors, :titles

    create_table :maps do |t|
      t.references :title, null: false
      t.string :name, null: false
      t.timestamps
    end
    add_foreign_key :maps, :titles

    create_table :rounds do |t|
      t.references :tournament, null: false, index: true
      t.string :name, null: false
      t.integer :sort_order, null: false
      t.timestamps
    end
    add_foreign_key :rounds, :tournaments

    add_index :rounds, [:tournament_id, :sort_order], unique: true

    create_table :matches do |t|
      t.references :round, null: false, index: true
      t.references :map, null: false
      t.integer :best_of, null: false
      t.integer :sort_order, null: false
      t.timestamps
    end
    add_foreign_key :matches, :rounds
    add_foreign_key :matches, :maps

    create_table :match_participations do |t|
      t.references :match, null: false, index: true
      t.references :competitor, null: false
      t.integer :score
      t.timestamps
    end
    add_foreign_key :match_participations, :matches
    add_foreign_key :match_participations, :competitors
  end
end
