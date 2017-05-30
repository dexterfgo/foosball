class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.integer :first_player
      t.integer :second_player
      t.integer :score
      t.string :name
      t.boolean :win

      t.timestamps
    end
  end
end
