*** Settings ***
Documentation     Verify Hide Common Features for Honda Activa and TVS Jupiter.
Resource          ../../resources/common.resource
Resource          ../../resources/pages/comparison_page.resource
Suite Setup       Open BikeDekho Page    ${COMPARISON_PATH}
Suite Teardown    Close BikeDekho Browser
Test Tags         comparison    regression    TC-COMP-04

*** Test Cases ***
TC-COMP-04 Hide Common Features And Show Only Different Values
    Wait Until Page Contains Element    ${COMPARISON_DATA_ROWS}
    Hide Common Comparison Features
    Visible Comparison Rows Should Contain Different Values
