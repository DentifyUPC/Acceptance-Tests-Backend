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

Scenario: Update patient anamnesis (US13)
    Given the endpoint PUT /api/v1/anamnesis/1 is available
    When the odontologist updates anamnesis "1" with "high blood pressure" and "penicillin allergy"
    Then the system updates the anamnesis
    And responds with 200 OK

  Scenario: Update a tooth status on the odontogram (US14)
    Given the endpoint PUT /api/v1/odontogram-item/10 is available
    When the odontologist updates item "10" (tooth 4.8) to status "3" (Absent)
    Then the system updates the tooth status
    And responds with 200 OK

  Scenario: Add an item to a prescription
    Given the endpoint POST /api/v1/prescription-items is available
    When the odontologist adds "Amoxicillin 500mg" to prescription "15"
    Then the system registers the item in the prescription
    And responds with 201 Created

  Scenario: Retrieve tooth status catalog
    Given the endpoint GET /api/v1/tooth-status is available
    When the odontologist requests the catalog
    Then the system returns 200 OK and the list of statuses (e.g., "Caries", "Absent", "Restoration")

  Scenario: Retrieve all clinical record entries for a patient (US11)
    Given the endpoint GET /api/v1/clinical-record-entries/clinical-record-id/1 is available
    When the odontologist requests the entries for clinical record "1"
    Then the system returns 200 OK and the list of evolutions (clinical record entries)