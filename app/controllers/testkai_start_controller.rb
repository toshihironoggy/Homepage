class TestkaiStartController < ApplicationController
  
  before_action :authenticate_employees
  
  def index
    @schools = School.all
    @testkai = Testkai.all
    
    respond_to do |format|
      format.html do
          #html用の処理を書く
      end 
      format.csv do
        @testkai.each do |test|
          send_data render_to_string.encode(Encoding::Windows_31J, 
          undef: :replace, row_sep: "\r\n", force_quotes: true), 
          filename: "#{test.year}年#{test.month}月#{test.day}日_開始報告.csv", type: :csv
        end
      end
    end
  end

  def new
  end

  def create
    employee = Employee.find_by(id: session[:employee_id]) 
    @school = School.find_by(name: employee.name) 

    schoolnameTemp = @school.schoolname
    nameTemp = @school.name
    idTemp = @school.id
    @school.destroy
    # @member = Member.find_by(schoolname: school.schoolname)
    
    @school = School.new(
      id: idTemp,
      schoolname: schoolnameTemp,
      name: nameTemp,
      chief: params[:chief], 
      security: params[:security], 
      staff: params[:staff], 
      supervision: params[:supervision],
      content: params[:content]
    )
    
    @school.save
    flash[:notice] = "success!"
    redirect_to("/testkai_start/index")
  end 
end
