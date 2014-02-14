json.array!(@student_group_kinds) do |student_group_kind|
  json.extract! student_group_kind, :id, :name, :description
  json.url student_group_kind_url(student_group_kind, format: :json)
end
