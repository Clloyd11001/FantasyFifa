class AddMatchesToBrackets < ActiveRecord::Migration[7.0]
  def change
    add_column :brackets, :matches, :integer
  end
end
