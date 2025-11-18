Feature: Clinical Evolution Management
  As a dentist
  I want to document clinical information for each appointment
  So that the patient’s evolution is properly recorded

  Scenario: Dentist registers clinical information for an appointment
    Given the endpoint POST /api/v2/patients/{id}/history exists
    When the dentist submits valid data (diagnosis, notes, procedures, appointmentId)
    Then the system stores the entry and returns 201 Created

  Scenario: Dentist updates clinical information for an appointment
    Given a clinical entry exists
    When the dentist sends PUT /api/v2/patients/history/{entryId} with updated data
    Then the system updates the entry and returns 200 OK

  Scenario: Dentist updates an existing evolution entry
    Given an evolution entry exists
    When the dentist edits notes or procedures
    Then the system applies the update and returns 200 OK

  Scenario: Dentist registers a prescription
    Given the endpoint POST /api/v2/patients/{id}/prescriptions exists
    When the dentist submits valid prescription data
    Then the system saves the prescription and returns 201 Created
