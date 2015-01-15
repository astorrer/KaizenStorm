class AddHoldAndRevisionToSuggestions < ActiveRecord::Migration
  def change
    add_column :suggestions, :hold, :boolean
    add_column :suggestions, :revision, :boolean
  end
end
