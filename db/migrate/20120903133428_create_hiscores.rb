class CreateHiscores < ActiveRecord::Migration
  def change
    create_table :hiscores do |t|
      t.string :name
      t.integer :score
      t.integer :rank
      t.string :devid
      t.datetime :achieved_date

      t.timestamps
    end
  end
end
