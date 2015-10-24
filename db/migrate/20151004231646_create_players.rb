class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :pos
      t.string :hometown
      t.string :city
      t.string :state
      t.float :latitude
      t.float :longitude
      t.string :team

      t.timestamps null: false
    end
  end
end
