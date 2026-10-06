*** Settings ***
Documentation     Verify alphabetic and symbol input is rejected by numeric fields.
Resource          ../../resources/common.resource
Resource          ../../resources/pages/calculator_page.resource
Resource          ../../variables/test_data.resource
Suite Setup       Open BikeDekho Page    ${CALCULATOR_PATH}
Suite Teardown    Close BikeDekho Browser
Test Tags         calculator    regression    TC-CALC-10

*** Test Cases ***
TC-CALC-10 Reject Alphabetic And Symbol Daily Distance
    Input Text    ${PETROL_DAILY_DISTANCE_INPUT}    ${VALID_DISTANCE}
    Enter Invalid Daily Distance    ${INVALID_ALPHA_INPUT}
    ${distance}=    Get Daily Distance Value
    Should Be Empty    ${distance}
    Enter Invalid Daily Distance    ${INVALID_SYMBOL_INPUT}
    ${distance}=    Get Daily Distance Value
    Should Be Empty    ${distance}
