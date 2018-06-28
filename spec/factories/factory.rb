def random_int
    Random.rand(1000).to_s
end

FactoryBot.define do
    factory :user do
        username { "test#{random_int}" }
        email "test#{random_int}@getflywheel.com"
        activated true
        password 'Flywheel1!'
        after(:build) { |user| user.encrypt_password } 
    end
   
    factory :category do
        name 'some category'
    end
 
    factory :submission do
        title "some submission#{random_int}"
        content "some info about idea/bug#{random_int}"
        category factory: :category
        user factory: :user 
    end
    
end


