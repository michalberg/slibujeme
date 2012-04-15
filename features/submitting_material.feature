Feature: Submitting material
  In order to submit new material
  As a user
  I want use a form for it

  @javascript
  Scenario: Submitting material
    Given there are the following elections:
      | title              |
      | krajské volby 2012 |
    And there are the following municipalities:
      | id | title             | parent_id |
      | 1  | Jihomoravský kraj |           |
      | 2  | Brno-město        | 1         |
      | 3  | Brno              | 2         |
    And there are the following parties:
      | title |
      | ODS   |
    And there are the following topics:
      | id | title        | parent_id |
      | 1  | Doprava      |           |
      | 2  | MHD          | 1         |
      | 3  | Cyklostezky  | 1         |
      | 4  | Podnikání    |           |
      | 5  | Zaměstnanost | 4         |
    And I am on the material submit page
    When I select "krajské volby 2012" from "Volby"
    And I type in "Brn" into autocomplete list "municipality_name" and I choose "Brno (okr. Brno-město)"
    And I select "ODS" from "Strana"
    And I type in "Cykl" into javascript select box "Témata" and I choose "Cyklostezky"
    And I type in "Zam" into javascript select box "Témata" and I choose "Zaměstnanost"
    And I type "Jiří Paroubek" in "Osoby" tag textarea 
    And I type "Josef Dobeš" in "Osoby" tag textarea 
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
    And I should see "Cyklostezky"
    And I should see "Zaměstnanost"
    And I should see "Jiří Paroubek"
    And I should see "Josef Dobeš"
