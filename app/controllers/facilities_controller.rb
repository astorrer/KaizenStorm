class FacilitiesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_facility, only: [:show, :edit, :update, :destroy, :submitted]

  respond_to :html

  def index
    @facilities = Facility.all
    respond_with(@facilities)
  end

  def show
    @facilities = Facility.all
    respond_with(@facility)
  end

  def new
    @facility = Facility.new
    respond_with(@facility)
  end

  def edit
  end

  def create
    @facility = Facility.new(facility_params)
    @facility.save
    respond_with(@facility)
  end

  def update
    @facility.update(facility_params)
    respond_with(@facility)
  end

  def destroy
    @facility.destroy
    respond_with(@facility)
  end

  private
    def set_facility
      @facility = Facility.find(params[:id])
    end

    def facility_params
      params.require(:facility).permit(:name)
    end
end
