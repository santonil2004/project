json.array!(@posts) do |post|
  json.extract! post, :title, :introtext, :description, :status, :category_id
  json.url post_url(post, format: :json)
end
