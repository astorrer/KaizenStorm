class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.datetime :reviewed_at
      t.datetime :completed_at
      t.datetime :verified_at
      t.boolean :completed
      t.boolean :verified
      t.boolean :meets_theme
      t.boolean :funded
      t.string :suggestion_type
      t.string :status
      t.string :statement
      t.integer :facility_id
      t.integer :department_id
      t.boolean :reviewed
      t.text :current_state
      t.text :ideal_state
      t.text :benefits
      t.string :line

      t.timestamps null: false
    end
  end
end
