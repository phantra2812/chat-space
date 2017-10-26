FactoryGirl.define do

  factory :message do
    body        { Faker::Lorem.sentence(50) }
    image       { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/images/test.png')) }
    group
    user
    created_at  { Faker::Time.between(5.days.ago, 3.day.ago, :all) }
    updated_at  { Faker::Time.between(2.days.ago, Time.now, :all) }
  end

end
