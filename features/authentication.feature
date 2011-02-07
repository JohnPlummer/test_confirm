Feature: Authentication

  This scenario fails on the last step I am getting a flash message of
  "You need to sign in or sign up before continuing." Rather than
  "You have signed up successfully. However, we could not sign you in because your account is unconfirmed."
  which is the correct message according to test/integration/registerable_test.rb -
  test 'a guest user should be able to sign up successfully and be blocked by confirmation'

  Scenario: Register new user
    Given I am not signed in
    And I am on the sign up page
    And I fill in the following:
      | Email                 | fred@foo.bar |
      | Password              | password     |
      | Password confirmation | password     |
    When I press "Sign up"
    Then a new user should get created with the following details:
      | email        |
      | fred@foo.bar |
    And I should receive an email with the following details:
      | subject                   | body                                                |
      | Confirmation instructions | You can confirm your account through the link below |
    And I should be on the sign in page
    And I should see "You have signed up successfully. However, we could not sign you in because your account is unconfirmed."
