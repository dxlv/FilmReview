class AddFilmIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :film_id, :integer
  end
end
