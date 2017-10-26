FactoryGirl.define do

  factory :group do
    name        { Faker::HarryPotter.character }
    created_at  { Faker::Time.between(5.days.ago, 3.day.ago, :all) }
    updated_at  { Faker::Time.between(2.days.ago, Time.now, :all) }
  end

end

