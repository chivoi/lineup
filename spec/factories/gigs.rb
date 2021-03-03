FactoryBot.define do
  factory :gig do
    date { "2021-03-03" }
    time { "2021-03-03 17:07:10" }
    venue { "MyString" }
    location { "MyString" }
    description { "MyText" }
    musictype { nil }
    set_length { 1 }
    tickets_presale { "" }
    door_charge { "" }
    payment { 1 }
    filled { false }
    user_id { nil }
  end
end
