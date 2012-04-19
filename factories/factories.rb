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
  
  factory :polititian do
    sequence(:name, 12345) { |n| "Politik no. #{n}"}
  end
  
  factory :user do
    sequence(:email) { |n| "email-#{n}@domain.tld" }
    password "password"
  end
  
  factory :material do
    association :election, factory: :election
    association :party, factory: :party
    association :municipality, factory: :municipality
    topics { |material| [
      material.association(:topic, :title => "doprava"),
      material.association(:topic, :title => "politika")
    ]}
    polititians { |material| [
      material.association(:polititian)
    ]}
    comment "Komentář k dokumentu"
  end

  factory :image_asset do
    image { Rack::Test::UploadedFile.new(Rails.root.join(*%w[factories files image_asset_fixture.png]), "image/png") }
  end
end