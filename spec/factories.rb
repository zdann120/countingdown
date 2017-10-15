FactoryGirl.define do
  factory :user do
    
  end
  factory :clock do
    countdown_to "2017-10-14 22:32:13"
    title "MyString"
    description "MyText"
    token ""
    slug ""
    public false
  end
end
