json.array!(@inquiries) do |inquiry|
  json.extract! inquiry, :id, :email, :subject, :description, :first_name, :last_name
  json.url inquiry_url(inquiry, format: :json)
end
