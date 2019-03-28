# frozen_string_literal: true

FactoryBot.define do
  factory :friendship do
    association :user
    association :friend_user
  end
end
