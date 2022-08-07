class StudentsController < ApplicationController
  layout 'admin'
  before_action :set_student, only: %i[show edit update destroy]

  helper_method :formatted_date

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params
      # first_name: params[:student][:first_name],
      # last_name: params[:student][:last_name],
      # email: params[:student][:email],
      # age: params[:student][:age]
    )

    if @student.save
      redirect_to students_path, notice: 'Student has successfully created'
    else
      render :new
    end
  end

  def show
  end

  def edit
    date = formatted_date(@student.date_of_birth)
  end

  def update
    if @student.update(student_params)
      # redirect_to students_path
      redirect_to students_path(@student), notice: 'Student has successfully updated'
    else
      render :edit
    end
  end


  def destroy
    @student.destroy
    redirect_to students_path, notice: 'Student has successfully destroyed'
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email,
      :date_of_birth, :permanent_address, :local_address, :permanent_contact_number,
      :alternate_contact_number)
  end

  def formatted_date(date)
    date.strftime('%A, %b %d %Y') if date.present?
  end
end