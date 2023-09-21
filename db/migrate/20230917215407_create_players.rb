class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name
      t.references :bracket, null: true, foreign_key: true # Change null: false to null: true
      t.timestamps
    end
  end
end
