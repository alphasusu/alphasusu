json.array!(@student_groups) do |student_group|
  json.extract! student_group, :id, :name, :description
  json.url student_group_url(student_group, format: :json)
end
