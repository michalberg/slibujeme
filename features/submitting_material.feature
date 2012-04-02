Feature: Submitting material
  In order to submit new material
  As a user
  I want use a form for it

  Scenario: Submitting material
    Given there are the following elections:
      | title              |
      | krajské volby 2012 |
    And there are the following municipalities:
      | title                  |
      | Brno (okr. Brno-město) |
    And there are the following parties:
      | title |
      | ODS   |
    And I am on the material submit page
    When I select "krajské volby 2012" from "Volby"
    And I select "Brno (okr. Brno-město)" from "Obec"
    And I select "ODS" from "Strana"
    And I fill in "Témata" with
    """
    doprava,
    """
    And I fill in "Osoby" with
    """
    Jiří Paroubek, Josef Dobeš
    """
    And I fill in "Komentář" with
    """
    Našel jsem to ve schránce
    """
    And I fill in "Kontakt" with "user@email.tld"
    And I press "Vložit"
    
    Then I should see "Děkujeme za nahrání dokumentu."
    And I should see "krajské volby 2012"
    And I should see "Brno (okr. Brno-město)"
    And I should see "ODS"
    And I should see "doprava"
    And I should see "Jiří Paroubek"
    And I should see "Josef Dobeš"
