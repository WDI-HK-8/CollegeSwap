json.array! @items do |item|
  json.id item.id
  json.name item.name
  json.description item.description
  json.category item.category
  json.price item.price
  json.user_id item.user_id
  json.created_at item.created_at
  json.image item.image
  json.accepted item.accepted
  json.email item.user.email
end