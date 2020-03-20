class AddEndrepotToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :student, :integer
    add_column :schools, :classroom, :integer
    add_column :schools, :mainroom, :integer
    add_column :schools, :endcontent, :text
  end
end
