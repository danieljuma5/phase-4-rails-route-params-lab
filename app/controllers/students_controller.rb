class StudentsController < ApplicationController

  def index
    if params[:name].present?
      query = "%#{params[:name].downcase}%"
      students = Student.where('lower(first_name) LIKE ? OR lower(last_name) LIKE ?', query, query)
    else
      students = Student.all
    end
    render json: students
  end
  def show
    student = Student.find(params[:id])
    render json: student
  end
end
