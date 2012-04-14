# encoding: utf-8

FactoryGirl.define do
  factory :election do
    sequence(:title, 2010) { |n| "Volby #{n}"}
  end
  
  party_no = sequence(:party_no).next
  factory :party do
    title "Strana ##{party_no}"
    full_title "Plný název strany #{party_no}"
  end
  
  factory :municipality do
    title "Brno (okr. Brno-město)"
  end
  
  factory :topic do
    title "Sociální oblast"
  end
  
  factory :material do
    association :election, factory: :election
    association :party, factory: :party
    association :municipality, factory: :municipality
    topics { |material| [
      material.association(:topic, :title => "doprava"),
      material.association(:topic, :title => "politika")
    ]}
    polititians "politik, politik2"
    comment "Komentář k dokumentu"
    sequence(:contact) { |n| "example-#{n}@domain.tld" }
  end
end