# encoding: utf-8

FactoryGirl.define do
  factory :election do
    sequence(:title, 2010) { |n| "Volby #{n}"}
  end
  
  factory :party do
    sequence(:title) { |n| "Strana ##{n}"}
  end
  
  factory :municipality do
    title "Brno (okr. Brno-město)"
  end
  
  factory :material do
    association :election, factory: :election
    association :party, factory: :party
    association :municipality, factory: :municipality
    topics "doprava, politika"
    polititians "politik, politik2"
    comment "Komentář k dokumentu"
    sequence(:contact) { |n| "example-#{n}@domain.tld" }
  end
end