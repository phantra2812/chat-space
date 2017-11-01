json.array! @new_messages do |message|
  json.name       message.user.name
  json.body       message.body
  json.image      message.image.url
  json.group_id   message.group_id
  json.user_id    message.user_id
  json.time       message.created_at.strftime("%Y-%m-%d %H:%M:%S")
  json.id         message.id
end
