# encoding: utf-8

# importing elections
elections = [
  "krajské volby 2012"
]
elections.each { |title| Election.create(:title => title) }
  