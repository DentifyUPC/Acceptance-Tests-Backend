Feature: Patient Data Management
  As a dentist
  I want to register personal and clinical data of the patient
  So that their information is properly documented

  Scenario: Dentist registers patient anamnesis
    Given the endpoint POST /api/v2/patients/{id}/anamnesis exists
    When the dentist submits valid anamnesis data
    Then the system stores the information and returns 201 Created
