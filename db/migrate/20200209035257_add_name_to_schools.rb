class AddNameToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :schoolname, :string 
    add_column :schools, :name, :string         
  end
end
