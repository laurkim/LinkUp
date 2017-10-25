Fabricator(:user) do
  name { Faker::GameOfThrones.character }
  username { Faker::Internet.user_name }
  password_digest { Faker::Internet.password(8) }
  prof_pic_url { "http://i0.kym-cdn.com/photos/images/facebook/000/993/875/084.png" }
end
