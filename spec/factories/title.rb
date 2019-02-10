FactoryBot.define do
  factory :title, class: "Fanboy::Models::Title" do
    name { Faker::Esport.game }
    nickname { name }
    slug { nickname.downcase.gsub(/[^a-z0-9]/, "") }
    developer { Faker::Company.name }
    sequence :priority do |i|
      i
    end
  end
end
