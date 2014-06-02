FactoryGirl.define do 
  factory :user do
    name     "Sample Name"
    email    "sample@mail.com"
    password "foobar"
    password_confirmation "foobar"
	end
end