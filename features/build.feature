Feature: Build
  In order to build a website

  Scenario: All required arguments are provided
    When I run `posocl build -c "../../config_example.yml"`
    Then the output should contain "Website was successfully build"
