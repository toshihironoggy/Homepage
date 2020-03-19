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

  sums = [
    "合計", 
    @schools.all.sum(:chief),
    @schools.all.sum(:security),
    @schools.all.sum(:staff),
    @schools.all.sum(:supervision)
  ]
  csv << sums  
end