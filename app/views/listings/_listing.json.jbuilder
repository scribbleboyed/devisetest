json.extract! listing, :id, :board_id, :employer_id, :company_id, :job_title, :job_description, :job_location, :job_type, :job_url, :contact_email, :created_at, :updated_at
json.url listing_url(listing, format: :json)
