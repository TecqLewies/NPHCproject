*** Settings ***
Resource    ${CURDIR}/commonKeyword.robot
*** Keywords ***
Upload file and refresh table
    [Arguments]     ${fileName}
    Choose File    ${chooseFileXPath}    ${fileName}
    Click Button    ${refreshTaxReliefTableXPath}

Validate row numbers
    [Arguments]     ${expected_row_number}
    Wait Until Element Is Visible     ${taxReliefTableXPath}      timeout=5
    ${rows_count}=  Get Element Count    ${taxReliefTableRowsXPath}
    ${rows_count}=      Convert To String    ${rows_count}
    Should Be Equal    ${rows_count}    ${expected_row_number}

Validate no data
    Wait Until Element Is Visible     ${noRecordsMessageXPath}      timeout=5
    ${No_Records_Message}=      Get Text     ${noRecordsMessageXPath}
    Should Contain      ${No_Records_Message}       ${noRecordsMessage}