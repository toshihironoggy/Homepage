class AddTagToMovie < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :tag_name, :string 
  end
end
