# feature/signin.feature
Feature: View signin page
  As a client, I want to be presented with a login when i visit
  the site, so that I can signin and order food
Scenario: User sees the signin page
  When A user goes to the signin page
  Then They should see the login form

