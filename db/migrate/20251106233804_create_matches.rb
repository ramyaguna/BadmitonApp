class CreateMatches < ActiveRecord::Migration[8.0]
  def change
    create_table :matches do |t|
      t.integer :code
      t.string :name
      t.jsonb :result

      t.timestamps
    end
  end
end
