FactoryGirl.define do
  factory :user do
    sequence(:name)     {|n| "Person #{n}"}
    sequence(:email)    {|n| "test_#{n}@rgu.ac.uk"}
    password "foobar"
    password_confirmation "foobar"
    sequence(:surname)  {|n| "Kim #{n}"}
    phone "07846578524"

    factory :admin do
    	admin true
    end	
  end

  factory :song do
    title "Example Song"
    artist "Example Artist"
    lyrics "G          C             D
            We stand and lift up our hands
                    G          C             D
            For the joy of the Lord is our strength"
    key "G"
  end
end