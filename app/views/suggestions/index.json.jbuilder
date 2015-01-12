json.array!(@suggestions) do |suggestion|
  json.extract! suggestion, :id, :reviewed_at, :completed_at, :verified_at, :completed, :verified, :meets_theme, :funded, :suggestion_type, :status, :statement, :facility_id, :department_id, :reviewed, :current_state, :ideal_state, :benefits, :line
  json.url suggestion_url(suggestion, format: :json)
end
