class CreateWatcheds < ActiveRecord::Migration[5.2]
  def change
    create_table :watcheds do |t|
      t.string :user_id
      t.string :movie_id

      t.timestamps
    end
  end
end
