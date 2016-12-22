json.extract! client, :id, :f_name, :l_name, :dob, :phone, :created_at, :updated_at
json.url client_url(client, format: :json)