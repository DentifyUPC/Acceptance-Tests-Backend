Feature: IAM Microservice
  As a developer configuring the system architecture
  I want to have a microservice that manages user registration and authentication
  So that user information and related services can be efficiently handled

  Scenario: Register new user
    Given the endpoint POST /api/v2/authentication/sign-up is available
    When a request is sent with valid user data
    Then the system creates the user account
    And responds with status 201 and the registered data

  Scenario: User sign-in
    Given the endpoint POST /api/v2/authentication/sign-in is available
    When a request is sent with valid credentials
    Then the system validates the credentials
    And returns tokens and status 200 if login is successful

  Scenario: Change user password
    Given the endpoint PUT /api/v2/users/edit/password/{username} is available
    When a request is sent with the user’s new password
    Then the system updates the password
    And returns a confirmation message

  Scenario: Retrieve own profile
    Given the protected endpoint GET /api/v2/users/{id} is available
    When the authenticated user requests their profile
    Then the system returns status 200 OK with the profile data (name, email, role, associated clinic, contact)