# Robot Framework Automation Instructions

## Purpose

Use these instructions while generating, updating, reviewing, or validating automation.

## Technology

- Robot Framework
- SeleniumLibrary
- Python
- WebDriver Manager

## Framework Structure

tests/

resource/
    pages/

variables/

datafiles/

reports/

screenshots/

## Framework Design

Always use:

- Page Object Model
- Keyword Driven Framework

## Rules

Always:

- Store locators in variable
- Store test data outside test scripts
- Reuse existing keywords and locators
- Use explicit waits
- Add assertions in every test
- Use meaningful names
- Keep automation readable

Preferred Locator Order:

1. id
2. name
3. css
4. xpath


Never:

- Hardcode values
- Duplicate code
- Duplicate keywords
- Duplicate locators
- Store locators in test files
- Use Sleep
- Use fixed waits

Good Names:

- LoginPage
- Login_User
- Verify_Successful_Login

Bad Names:

- Test1
- Action1
- Keyword1