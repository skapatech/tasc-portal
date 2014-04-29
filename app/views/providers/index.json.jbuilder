json.array!(@providers) do |provider|
  json.extract! provider, :id, :first_name, :middle_initial, :last_name, :email, :phone, :cell, :address1, :address2, :city, :state, :zip, :rate, :position, :organization, :years_experience, :resume
  json.url provider_url(provider, format: :json)
end
