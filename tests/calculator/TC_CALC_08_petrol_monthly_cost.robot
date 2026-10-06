*** Settings ***
Documentation     Verify the monthly petrol running cost calculation.
Resource          ../../resources/common.resource
Resource          ../../resources/pages/calculator_page.resource
Resource          ../../variables/test_data.resource
Suite Setup       Open BikeDekho Page    ${CALCULATOR_PATH}
Suite Teardown    Close BikeDekho Browser
Test Tags         calculator    regression    TC-CALC-08

*** Test Cases ***
TC-CALC-08 Calculate Petrol Monthly Running Cost
    Enter Petrol Calculator Values    ${PETROL_DISTANCE}    ${PETROL_PRICE}    ${PETROL_MILEAGE}
    ${monthly_cost}=    Get Petrol Monthly Cost
    Should Contain    ${monthly_cost}    ${PETROL_EXPECTED_MONTHLY_COST}
