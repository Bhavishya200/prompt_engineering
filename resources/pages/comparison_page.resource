*** Settings ***
Library         SeleniumLibrary
Library         Collections
Library         String
Resource        ../../variables/locators.resource

*** Keywords ***
Hide Common Comparison Features
    @{toggle_labels}=    Get WebElements    ${HIDE_COMMON_FEATURES_LABELS}
    ${toggle_clicked}=    Set Variable    ${FALSE}
    FOR    ${toggle_label}    IN    @{toggle_labels}
        ${is_visible}=    Call Method    ${toggle_label}    is_displayed
        IF    ${is_visible}
            Scroll Element Into View    ${toggle_label}
            Click Element    ${toggle_label}
            ${toggle_clicked}=    Set Variable    ${TRUE}
            BREAK
        END
    END
    Should Be True    ${toggle_clicked}    No visible Hide Common Features control was found.
    Wait Until Keyword Succeeds    5x    500ms    Common Comparison Rows Should Be Hidden

Common Comparison Rows Should Be Hidden
    @{common_rows}=    Get WebElements    ${COMMON_DATA_ROWS}
    FOR    ${row}    IN    @{common_rows}
        ${is_visible}=    Call Method    ${row}    is_displayed
        Should Not Be True    ${is_visible}    A common specification row is still visible.
    END

Visible Comparison Rows Should Contain Different Values
    @{rows}=    Get WebElements    ${DIFFERENT_DATA_ROWS}
    ${visible_row_count}=    Set Variable    ${0}
    FOR    ${row}    IN    @{rows}
        ${is_visible}=    Call Method    ${row}    is_displayed
        IF    ${is_visible}
            ${visible_row_count}=    Evaluate    ${visible_row_count} + 1
            ${cells}=    Call Method    ${row}    find_elements    tag name    td
            Length Should Be    ${cells}    3
            ${feature}=    Get Text    ${cells}[0]
            ${left_value}=    Get Text    ${cells}[1]
            ${right_value}=    Get Text    ${cells}[2]
            ${feature}=    Normalize Space    ${feature}
            ${left_value}=    Normalize Space    ${left_value}
            ${right_value}=    Normalize Space    ${right_value}
            Should Not Be Equal As Strings
            ...    ${left_value}
            ...    ${right_value}
            ...    Visible row '${feature}' contains the same value for both vehicles.
        END
    END
    Should Be True    ${visible_row_count} > 0    No differing specification rows were visible.

Normalize Space
    [Arguments]    ${value}
    ${value}=    Replace String Using Regexp    ${value}    \\s+    ${SPACE}
    RETURN    ${value.strip()}

