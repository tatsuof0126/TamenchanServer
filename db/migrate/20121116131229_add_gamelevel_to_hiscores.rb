class AddGamelevelToHiscores < ActiveRecord::Migration
  def change
    add_column :hiscores, :gamelevel, :integer
  end
end
