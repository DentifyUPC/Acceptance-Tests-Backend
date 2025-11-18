Feature: Schedule Management
  As an administrator
  I want to review and manage dentists' schedules
  So that appointment distribution is optimized

  Scenario: Administrator assigns a schedule to a dentist
    Given the endpoint POST /api/v2/schedules exists
    And a dentist is registered in the system
    When the administrator sends valid schedule data (date, startTime, endTime, dentistId)
    Then the system registers the schedule and returns 201 Created

  Scenario: Administrator removes a dentist schedule
    Given a schedule exists for a dentist
    When the administrator sends DELETE /api/v2/schedules/{scheduleId}
    Then the system deletes the schedule and returns 200 OK

  Scenario: Administrator updates a dentist's schedule
    Given an existing schedule is registered
    When the administrator sends PUT /api/v2/schedules/{id} with updated data
    Then the system updates the schedule and returns 200 OK
