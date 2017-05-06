json.extract! answer, :id, :name, :genre, :text, :score, :created_at, :updated_at
json.url answer_url(answer, format: :json)
