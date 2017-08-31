json.extract! publication, :id, :title, :bedroom, :bath, :parking, :description, :price, :created_at, :updated_at
json.url publication_url(publication, format: :json)
