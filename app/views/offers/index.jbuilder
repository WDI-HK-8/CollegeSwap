json.array! @offers do |offer|
  json.id offer.id
  json.text offer.text
  json.location offer.location
  json.time offer.time
  json.user_id offer.user_id
  json.created_at offer.created_at
  json.item_id offer.item_id
  json.itemtoswap offer.itemtoswap
  json.accepted offer.accepted
  json.reject offer.reject
end