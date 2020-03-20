require 'csv'

CSV.generate do |csv|
  @testkai.each do |test|
    column_value = [
      test.year,
      test.month,
      test.day,
      test.kai
    ]
    column_value[0] = column_value[0].to_s + "年"
    column_value[1] = column_value[1].to_s + "月"
    column_value[2] = column_value[2].to_s + "日"
    column_value[3] = "第" + column_value[3] + "回"
    csv << column_value
  end
  
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