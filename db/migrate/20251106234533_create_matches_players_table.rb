class CreateMatchesPlayersTable < ActiveRecord::Migration[8.0]
  def change
    create_table :matches_players do |t|
      t.references :match, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.timestamps
    end

    add_index :matches_players, [:match_id, :player_id], unique: true
  end
end
