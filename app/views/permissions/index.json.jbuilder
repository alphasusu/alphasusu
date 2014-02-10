json.array!(@permissions) do |permission|
  json.extract! permission, :id, :user_id, :subject_class, :subject_id, :action
  json.url permission_url(permission, format: :json)
end
