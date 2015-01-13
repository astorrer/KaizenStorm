class DepartmentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_department, only: [ :edit, :update, :destroy]

  respond_to :html

  def index
  end

  def new
    @department = Department.new
    respond_with(@department)
  end

  def edit
  end

  def create
    @department = Department.new(department_params)
    @department.save
    redirect_to departments_path
  end

  def update
    @department.update(department_params)
    redirect_to departments_path
  end

  def destroy
    @department.destroy
    respond_with(@department)
  end

  private
    def set_department
      @department = Department.find(params[:id])
    end

    def department_params
      params.require(:department).permit(:name, :facility_id)
    end
end
