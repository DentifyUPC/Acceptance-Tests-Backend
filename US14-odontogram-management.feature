Feature: Odontogram Management
  As a dentist
  I want to view and modify the patient's odontogram
  So that dental conditions are registered accurately

  Scenario: Dentist visualizes patient's odontogram
    Given the endpoint GET /api/v2/patients/{id}/odontogram exists
    When the dentist requests the odontogram
    Then the system returns 200 OK with dental piece states

  Scenario: Dentist registers a new state for a tooth
    Given the endpoint POST /api/v2/patients/{id}/odontogram exists
    When the dentist submits valid tooth state data
    Then the system stores the new state and returns 201 Created

  Scenario: Dentist updates a tooth state
    Given a tooth state exists
    When the dentist sends PUT /api/v2/patients/odontogram/{toothStateId}
    Then the system updates the state and returns 200 OK
