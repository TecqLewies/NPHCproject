*** Settings ***
Library     Collections
Resource    ${CURDIR}/commonKeyword.robot

*** Keywords ***
Check button color
    [Arguments]     ${browser}
    ${button_element}=  Get WebElement   ${dispenseNowButtonXPath}
    ${button_color}=    Call Method    ${button_element}    value_of_css_property   background-color
    ${button_string}=     Convert To String    ${button_color}
    ${button_string}=   Get Substring   ${button_string}    0   -1
    IF    "${browser}" == "${driver_firefox}"
        ${button_string}=   Get Substring   ${button_string}    4
    ELSE
         ${button_string}=   Get Substring   ${button_string}    5
    END
    ${rgb_list}=    Split String    ${button_string}    ,
    ${color_r}=    Get From List    ${rgb_list}    0
    ${color_g}=    Get From List    ${rgb_list}    1
    ${color_b}=    Get From List    ${rgb_list}    2

    Should Be True    (${color_r}<=255 and ${color_r}>=160) and (${color_b}<=75 and ${color_b}>=0) and (${color_g}<=75 and ${color_g}>=0)

Check button text
    ${button_element}=  Get WebElement   ${dispenseNowButtonXPath}
    ${button_element_text}=     Get Text   ${button_element}
    Should Be Equal    ${button_element_text}    ${dispenseNowMessage}

Click button and validate text
    Click Element    ${dispenseNowButtonXPath}
    Wait Until Element Is Visible    ${cashDispensedXPath}  timeout=5
    ${text_element}=    Get WebElement    ${cashDispensedXPath}
    ${text_element_text}=   Set Variable    ${text_element.text}
    Should Be Equal    ${text_element_text}    ${cashDispensedMessage}

