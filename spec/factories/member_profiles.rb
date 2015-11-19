FactoryGirl.define do
  factory :member_profile do
    sequence(:email){|n| "joe.bloggs#{ n }@example.com" }
    password "password"
    password_confirmation "password"

    factory :expired_password_reset_member_profile do
      password_reset_token { SecureRandom.urlsafe_base64 }
      password_reset_sent_at { Time.zone.now - 3.hours }
    end
  end
end
