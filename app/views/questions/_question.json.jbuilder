json.extract! question, :id, :name, :genre, :created_at, :updated_at
json.url question_url(question, format: :json)
