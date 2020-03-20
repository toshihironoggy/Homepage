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

  csv_column_names = %w(学校名 受験人数 使用教室 本部)
  csv << csv_column_names
  
  @schools.each do |school|
    column_values = [
      school.schoolname,
      school.student,
      school.classroom, 
      school.mainroom
    ]
    csv << column_values
  end

  sums = [
    "合計", 
    @schools.all.sum(:student),
    "",
    ""
  ]
  csv << sums  
end