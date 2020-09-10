FactoryBot.define do
  factory :article do
    title { "MyString" }
    text { "MyText" }
    author_id { 1 }
    votes_count { 1 }
  end
end
