*** Settings ***
Library         SeleniumLibrary    run_on_failure=Capture Page Screenshot
Resource        ../variables/config.resource

*** Keywords ***
Open BikeDekho Page
    [Arguments]    ${path}
    Open Browser    ${BASE_URL}${path}    ${BROWSER}
    Set Selenium Timeout    ${DEFAULT_TIMEOUT}
    Set Window Size    1440    1000

Close BikeDekho Browser
    Run Keyword And Ignore Error    Capture Page Screenshot
    Close All Browsers
