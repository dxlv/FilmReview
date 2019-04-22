class CreateFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
      t.string :name
      t.text :director
      t.text :cast
      t.text :desc
      t.integer :year

      t.timestamps
    end
  end
end
