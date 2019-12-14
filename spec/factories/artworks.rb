FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name { "Doe" }
    username { "johndoe" }    
    email { "johndoe@yopmail.com" }  
    password { "testoto" }  
  end
end