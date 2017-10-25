Fabricator(:comment) do
  content { Faker::Lorem.sentence }
  user(inverse_of: :user)
  Event.first.id
end
