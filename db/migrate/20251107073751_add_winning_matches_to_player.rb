class AddWinningMatchesToPlayer < ActiveRecord::Migration[8.0]
  def change
    add_column :players, :winning_matches, :integer
  end
end
