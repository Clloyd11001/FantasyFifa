class CreateBrackets < ActiveRecord::Migration[6.0]
    def change
      create_table :brackets do |t|
        t.jsonb :data, null: false, default: {}
        t.timestamps
      end
    end
  end
  