class CreateDecks < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name, :null => false, :unique => true
      t.timestamps
    end

    create_table :decks do |t|
      t.integer :deck_type_id, :null => false
      t.references :game, :null => false
      t.text :cards_order
      t.datetime :last_viewed_at
      t.text :last_viewed_by
      t.timestamps
    end

    create_table :cards do |t|
      t.integer :deck_type_id, :null => false
      t.string :name, :null => false
      t.timestamps
    end

    add_index :decks, :game_id
    add_index :decks, [:game_id, :deck_type_id], :unique => true
    add_index :cards, :deck_type_id

  end
end
