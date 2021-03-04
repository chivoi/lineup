FactoryBot.define do
  factory :gig do
    date { "2021-03-21" }
    time { "2pm" }
    venue { "The Old Bar" }
    location { "Fitzroy" }
    description { "It's a cool gig" }
    musictype_id { 1 }
    set_length { 45 }
    tickets_presale { "8.85" }
    door_charge { "10" }
    payment { 2 }
    filled { false }
    user_id { 1 }
  end
end
