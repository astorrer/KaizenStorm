module DynamicSelect
  class DepartmentsController < ApplicationController
    respond_to :json

    def index
      @departments = Department.where(:facility_id => params[:facility_id])
      respond_with(@departments)
    end
  end
end
