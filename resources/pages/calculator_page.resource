*** Settings ***
Library         SeleniumLibrary
Resource        ../../variables/locators.resource

*** Keywords ***
Enter Petrol Calculator Values
    [Arguments]    ${distance}    ${price}    ${mileage}
    Wait Until Element Is Visible    ${PETROL_DAILY_DISTANCE_INPUT}
    Set Calculator Input Value    ${PETROL_DAILY_DISTANCE_INPUT}    ${distance}
    Set Calculator Input Value    ${PETROL_PRICE_INPUT}    ${price}
    Set Calculator Input Value    ${PETROL_MILEAGE_INPUT}    ${mileage}

Set Calculator Input Value
    [Arguments]    ${locator}    ${value}
    ${element}=    Get WebElement    ${locator}
    Execute Javascript
    ...    const input = arguments[0];
    ...    const value = String(arguments[1]);
    ...    const setter = Object.getOwnPropertyDescriptor(HTMLInputElement.prototype, 'value').set;
    ...    setter.call(input, value);
    ...    input.dispatchEvent(new Event('input', { bubbles: true }));
    ...    input.dispatchEvent(new Event('change', { bubbles: true }));
    ...    ARGUMENTS    ${element}    ${value}
    Wait Until Keyword Succeeds    5x    300ms    Element Attribute Value Should Be    ${locator}    value    ${value}

Get Petrol Monthly Cost
    Wait Until Element Is Visible    ${PETROL_MONTHLY_COST}
    ${monthly_cost}=    Get Text    ${PETROL_MONTHLY_COST}
    RETURN    ${monthly_cost}

Select Electric Calculator
    Wait Until Element Is Visible    ${ELECTRIC_TAB}
    Scroll Element Into View         ${ELECTRIC_TAB}
    Click Element                    ${ELECTRIC_TAB}
    Wait Until Element Is Visible    ${EV_DAILY_DISTANCE_INPUT}

Enter Electric Calculator Values
    [Arguments]    ${distance}    ${range}    ${battery_capacity}    ${tariff}
    Input Text    ${EV_DAILY_DISTANCE_INPUT}    ${distance}
    Input Text    ${EV_RANGE_INPUT}    ${range}
    Input Text    ${EV_BATTERY_CAPACITY_INPUT}    ${battery_capacity}
    Input Text    ${EV_TARIFF_INPUT}    ${tariff}
    Press Keys    ${EV_TARIFF_INPUT}    TAB

Get Electric Monthly Cost
    Wait Until Element Is Visible    ${EV_MONTHLY_COST}
    ${monthly_cost}=    Get Text    ${EV_MONTHLY_COST}
    RETURN    ${monthly_cost}

Enter Invalid Daily Distance
    [Arguments]    ${invalid_value}
    Wait Until Element Is Visible    ${PETROL_DAILY_DISTANCE_INPUT}
    Input Text    ${PETROL_DAILY_DISTANCE_INPUT}    ${invalid_value}
    Press Keys    ${PETROL_DAILY_DISTANCE_INPUT}    TAB

Get Daily Distance Value
    ${distance}=    Get Value    ${PETROL_DAILY_DISTANCE_INPUT}
    RETURN    ${distance}
