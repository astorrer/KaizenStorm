class SuggestionsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_suggestion, only: [:show, :edit, :update, :destroy, :promote_to_reviewed,
                                        :promote_to_completed, :promote_to_verified, :promote_to_funded,
                                        :revise_status, :hold_status, :meets_the_theme]

  respond_to :html

  def promote_to_reviewed
    @suggestion.update(:reviewed => true, :reviewed_at => Time.now)
    redirect_to(:back)
  end

  def promote_to_completed
    @suggestion.update(:completed => true, :completed_at => Time.now)
    redirect_to(:back)
  end

  def promote_to_verified
    @suggestion.update(:verified => true, :verified_at => Time.now)
    redirect_to(:back)
  end

  def promote_to_funded
    @suggestion.update(:funded => true)
    redirect_to(:back)
  end

  def revise_status
    @suggestion.update(:status => 'Revise', :revision => true)
    redirect_to(:back)
  end

  def hold_status
    @suggestion.update(:status => 'On Hold', :hold => true)
    redirect_to(:back)
  end

  def meets_the_theme 
    @suggestion.update(:meets_theme => true)
    redirect_to(:back)
  end

  def index
    @suggestions = current_user.suggestions.all
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
    @suggestion.user_id = current_user.id # Set the suggestion's user ID, the lazy way.
    @suggestion.hold = false
    @suggestion.revision = false
    @suggestion.save
    respond_with(@suggestion)
  end

  def update
    @suggestion.update(suggestion_params)
    @suggestion.update(:status => 'Revised', :hold => false, :revision => false)
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
