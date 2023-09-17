# db/migrate/YYYYMMDDHHMMSS_create_brackets.rb

class CreateBrackets < ActiveRecord::Migration[7.0]
  def change
    create_table :brackets do |t|
      t.string :name
      t.text :position
      # Add other columns as needed
      t.timestamps
    end
  end
end
