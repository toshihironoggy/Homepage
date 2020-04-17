class CreateSlides < ActiveRecord::Migration[5.2]
  def change
    create_table :slides do |t|
      t.string :title
      t.string :image
      t.string :tag_name

      t.timestamps
    end
  end
end
