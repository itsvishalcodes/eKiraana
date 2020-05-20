json.extract! customerpersonalinfo, :id, :name, :phone, :address, :created_at, :updated_at
json.url customerpersonalinfo_url(customerpersonalinfo, format: :json)
