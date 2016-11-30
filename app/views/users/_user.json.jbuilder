json.extract! user, :id, :object_guid, :username, :ldap_attributes, :created_at, :updated_at
json.url user_url(user, format: :json)