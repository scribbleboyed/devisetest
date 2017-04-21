json.extract! company, :id, :board_id, :employer_id, :name, :description, :url, :created_at, :updated_at
json.url company_url(company, format: :json)
