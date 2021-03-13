class AddSeatsToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :max_num_seats, :integer
    add_column :schools, :little_left_seats, :integer
  end
end
