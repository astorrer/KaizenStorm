class SuggestionsController < ApplicationController
  before_action :set_suggestion, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @suggestions = Suggestion.all
    respond_with(@suggestions)
  end

  def show
    respond_with(@suggestion)
  end

  def new
    @suggestion = Suggestion.new
    respond_with(@suggestion)
  end

  def edit
  end

  def create
    @suggestion = Suggestion.new(suggestion_params)
    @suggestion.save
    respond_with(@suggestion)
  end

  def update
    @suggestion.update(suggestion_params)
    respond_with(@suggestion)
  end

  def destroy
    @suggestion.destroy
    respond_with(@suggestion)
  end

  private
    def set_suggestion
      @suggestion = Suggestion.find(params[:id])
    end

    def suggestion_params
      params.require(:suggestion).permit(:reviewed_at, :completed_at, :verified_at, :completed, :verified, :meets_theme, :funded, :suggestion_type, :status, :statement, :facility_id, :department_id, :reviewed, :current_state, :ideal_state, :benefits, :line)
    end
end
