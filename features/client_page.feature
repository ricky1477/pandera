Feature: Client Page

    In order to see all my clients
    As a user
    I want to see them publicly

    Scenario: guest user sees public clients
        Given I am a guest user
        When I go to clients' page
        Then I must see clients' content