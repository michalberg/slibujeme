Feature: Seed Data
  In order to fill the database with the basics
  As the system
  I want to run the seed task

  Background:
    Given I have run the seed task

  Scenario: Parties seed
    Then there should be the following parties created:
      | title              |
      | AS                 |
      | BPS                |
      | Piráti             |
      | ČP                 |
      | ČSNS               |
      | ČSSD               |
      | EDS                |
      | HS                 |
      | KDU-ČSL            |
      | KSČM               |
      | LEV 21             |
      | LIB                |
      | M                  |
      | Nezávislý kandidát |
      | NEZ/DEM            |
      | Občané             |
      | ODS                |
      | SNK ED             |
      | SPOZ               |
      | SPR-RSČ            |
      | Suverenita         |
      | SSO                |
      | STAN               |
      | SZ                 |
      | TOP 09             |
      | VV                 |
  
  Scenario: Municipalities are imported in tree
    Then there should be municipality "Blansko" with parent "Jihomoravský kraj" and child "Svinošice"

  Scenario: Topics are imported in tree
    Then there should be topic "Sociální oblast" with children:
      | title                     |
      | Senioři                   |
      | Menšiny                   |
      | Nezaměstnaní              |
      | Bezdomovci                |
      | Znevýhodnění občané       |
      | Služby pro sociálně slabé |
