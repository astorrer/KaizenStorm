json.array!(@departments) do |department|
  json.extract! department, :name, :id
end
