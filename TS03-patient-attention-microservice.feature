Feature: Patient Attention Microservice
  As a developer configuring the platform
  I want a microservice that manages patients’ clinical records
  So that patient medical information is properly stored and managed

  Scenario: Register clinical patient
    Given the endpoint POST /api/v2/patients is available
    When a request is sent with clinical data (name, emergency contact, allergies, address, document)
    Then the system creates the patient record and returns 201 Created

  Scenario: Retrieve patient medical history
    Given the endpoint GET /api/v2/patients/{id}/medical-history is available and the requester has permission
    When the history is requested
    Then the system returns 200 OK with the list of entries (date, dentist, evolutions, prescriptions, odontogram snapshot)

  Scenario: Add clinical evolution entry
    Given the endpoint POST /api/v2/patients/{id}/medical-history/entries is available
    When the dentist submits a new clinical evolution (observations, diagnoses, prescription, affected teeth)
    Then the system saves the entry and returns 201 Created

  Scenario: Update clinical entry
    Given the endpoint PUT /api/v2/patients/{id}/medical-history/entries/{entryId} exists
    When valid modifications are sent
    Then the system updates the entry and returns 200 OK

  Scenario: Register or update odontogram
    Given the endpoint PUT /api/v2/patients/{id}/odontogram is available
    When the dentist marks diagnoses per tooth (caries, restoration, etc.)
    Then the system saves and returns 200 OK

  Scenario: Validate prescription against allergies
    Given the endpoint POST /api/v2/patients/{id}/medical-history/entries/{entryId}/prescription is available
    And the patient has allergy records
    When the dentist adds a medication matching an allergy
    Then the system shows a warning and requires confirmation before saving
