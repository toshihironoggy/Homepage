class Add3dateToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :address, :string
    add_column :schools, :latitude, :float
    add_column :schools, :longitude, :float
  end
end
