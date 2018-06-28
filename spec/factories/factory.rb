FactoryBot.define do
    factory :user do
        username { "test#{Random.rand(1000).to_s}" }
        email "test#{Random.rand(1000)}@getflywheel.com"
        activated true
        password 'Flywheel1!'
        after(:build) { |user| user.encrypt_password } 
    end
   
    factory :category do
        name 'some category'
    end
 
    factory :submission do
        title 'some submission'
        content 'some info about idea/bug'
        category factory: :category
        user factory: :user 
    end
end
