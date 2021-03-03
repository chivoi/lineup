FactoryBot.define do
  factory :profile do
    name { "MyString" }
    playtime { "" }
    musictype { nil }
    demolinks { "MyText" }
    location { "MyString" }
    teamups { false }
    bio { "MyText" }
    user { nil }
  end
end
