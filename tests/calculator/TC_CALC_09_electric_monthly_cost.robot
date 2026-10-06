*** Settings ***
Documentation     Verify the monthly electric vehicle running cost calculation.
Resource          ../../resources/common.resource
Resource          ../../resources/pages/calculator_page.resource
Resource          ../../variables/test_data.resource
Suite Setup       Open BikeDekho Page    ${CALCULATOR_PATH}
Suite Teardown    Close BikeDekho Browser
Test Tags         calculator    regression    TC-CALC-09

*** Test Cases ***
TC-CALC-09 Calculate Electric Monthly Running Cost
    Select Electric Calculator
    Enter Electric Calculator Values
    ...    ${EV_DISTANCE}
    ...    ${EV_RANGE}
    ...    ${EV_BATTERY_CAPACITY}
    ...    ${EV_TARIFF}
    ${monthly_cost}=    Get Electric Monthly Cost
    Should Contain    ${monthly_cost}    ${EV_EXPECTED_MONTHLY_COST}
