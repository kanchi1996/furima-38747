FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    first_name            {"武田"}
    last_name             {"信玄"}
    first_name_kana       {"タケダ"}
    last_name_kana        {"シンゲン"}
    birthday              {"1930-01-01"}
  end
end
