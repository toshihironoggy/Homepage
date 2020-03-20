require 'csv'

CSV.generate do |csv|

  csv_column_names = %w(学校名 チーフ 学生警備 本部員 監督)
  csv << csv_column_names
  
  @schools.each do |school|
    column_values = [
      school.schoolname,
      school.chief,
      school.security, 
      school.staff,
      school.supervision
    ]
    csv << column_values
  end

end