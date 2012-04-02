Feature: Seed Data
  In order to fill the database with the basics
  As the system
  I want to run the seed task

  Scenario: Parties seed
    Given I have run the seed task
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
