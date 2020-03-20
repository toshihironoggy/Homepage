require 'csv'

CSV.generate do |csv|

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