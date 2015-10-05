class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :pos
      t.string :hometown
      t.float :latitude
      t.float :longitude
      t.integer :team_id

      t.timestamps null: false
    end
  end
end
