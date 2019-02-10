FactoryBot.define do
  factory :tournament, class: "Fanboy::Models::Tournament" do
    title
    name { Faker::Esport.event }
    starts { Date.today }
  end
end
