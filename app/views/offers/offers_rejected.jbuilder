json.array! @offers do |offer|
  json.id offer.id
  json.text offer.text
  json.location offer.location
  json.time offer.time
  json.user_id offer.user_id
  json.user_name User.find_by_id(offer.user_id).email
  json.created_at offer.created_at
  json.item_id offer.item_id
  json.item_name Item.find_by_id(offer.item_id).name
  json.sent_to Item.find_by_id(offer.item_id).user.email
  json.itemtoswap offer.itemtoswap
  json.itemtoswap_name Item.find_by_id(offer.itemtoswap).name
  json.accepted offer.accepted
  json.reject offer.reject
end