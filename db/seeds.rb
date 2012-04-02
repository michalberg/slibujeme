# encoding: utf-8

# importing elections
elections = [
  "krajské volby 2012"
]
elections.each { |title| Election.create(:title => title) }

# importing municipalities
# TODO

# importing parties
parties = %w{AS:BPS:Piráti:ČP:ČSNS:ČSSD:EDS:HS:KDU-ČSL:KSČM:LEV 21:LIB:M:Nezávislý kandidát:NEZ/DEM:Občané:ODS:SNK ED:SPOZ:SPR-RSČ:Suverenita:SSO:STAN:SZ:TOP 09:VV}.split(":")

parties.each {|title| Party.create(:title => title) }