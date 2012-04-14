# encoding: utf-8
require "csv"

# importing municipalities
CSV.table(Rails.root + "db/seed-municipalities.csv").each do |csv_row|
  Municipality.create(csv_row.to_hash)
end

# importing elections
elections = [
  "krajské volby 2012"
]
elections.each { |title| Election.create(:title => title) }

# importing parties
parties = 'AS:BPS:Piráti:ČP:ČSNS:ČSSD:EDS:HS:KDU-ČSL:KSČM:LEV 21:LIB:M:Nezávislý kandidát:NEZ/DEM:Občané:ODS:SNK ED:SPOZ:SPR-RSČ:Suverenita:SSO:STAN:SZ:TOP 09:VV'.split(":")

parties.each {|title| Party.create(:title => title) }

# importing topics
topics = {
  "Doprava" => [
        "Silnice",
        "Cyklostezky",
        "MHD",
        "parkování",
        "železnice"
      ],
  "Školství" => [
        "Mateřské školky",
        "Základní školy",
        "Střední školy",
        "Učiliště",
        "Vysoké školy",
        "jesle",
        "modernizace",
      ],
  "Sport" => [
        "amatérský sport",
        "infrastruktura sportovišť",
        "financování",
        "profesionální sport"
      ],
  "Kultura" => [
        "Divadlo",
        "Film",
        "Hudba",
        "Festivaly",
        "Spolky",
        "Výstavba, rekonstrukce"
      ],
  "Cestovní ruch" => [
        "Infrastruktura",
        "Akce",
        "Zdravotnictví",
        "Nemocnice",
        "Záchytné stanice"
      ],
  "Sociální oblast" => [
        "Senioři",
        "Menšiny",
        "Nezaměstnaní",
        "Bezdomovci",
        "Znevýhodnění občané",
        "Služby pro sociálně slabé"
      ],
  "Veřejná správa" => [
        "Rozpočet",
        "Úřad (např. otevřenost, atp.)",
        "Veřejné zakázky",
        "Korupce",
        "Příspěvkové organizace města",
        "Evropske dotace"
      ],
  "Životní prostředí" => [
        "Čistota města",
        "Veřejná zeleň",
        "Veřejná prostranství, chodníky",
        "Hluk"
      ],
  "Podnikání" => [
        "průmyslové zony",
        "zaměstnanost"
      ],
  "Občanská společnost" => [
        "NNO",
      ],
  "Bezpečnost" => [
        "veřejný pořádek",
        "městská policie",
        "protidrogová problematika"
      ]
}

topics.each do |title, children|
  @parent = Topic.create(:title => title)
  children.each { |child_title| @parent.children.create(:title => child_title) }
end