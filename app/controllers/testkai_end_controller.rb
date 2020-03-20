class TestkaiEndController < ApplicationController
before_action :authenticate_employees
  
  def index
    @schools = School.all
    
    respond_to do |format|
      format.html do
          #html用の処理を書く
      end 
      format.csv do
        send_data render_to_string.encode(Encoding::Windows_31J, undef: :replace, row_sep: "\r\n", force_quotes: true), filename: "終了報告.csv", type: :csv
        
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
  
  
    @school = School.new(
      id: idTemp,
      schoolname: schoolnameTemp,
      name: nameTemp,
      student: params[:student], 
      classroom: params[:classroom], 
      mainroom: params[:mainroom],
      content: params[:content]
    )
    
    @school.save
    flash[:notice] = "success!"
    redirect_to("/testkai_end/index")
  end 
end
