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