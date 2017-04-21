json.extract! board, :id, :name, :subdomain, :admin_id, :created_at, :updated_at
json.url board_url(board, format: :json)
