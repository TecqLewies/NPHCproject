*** Settings ***
Library     RequestsLibrary
Library     SeleniumLibrary
Library     OperatingSystem
Library     String
Resource    ${CURDIR}/../TestingData/commonVariables.robot
Resource    ${CURDIR}/../TestingData/WebUIVariables.robot

Test Teardown   Run Keyword    Teardown
*** Keywords ***
Build single person data to dictionary
    [Arguments]     ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}
    ${request_body}=    Create Dictionary   birthday=${birthday}    gender=${gender}   name=${name}     natid=${natid}     salary=${salary}     tax=${tax}
    [Return]    ${request_body}
Call API endpoint
    [Arguments]     ${base_url}     ${request_body}  ${content_type}    ${endpoint_insert}     ${status_code}
    Create Session    session    ${base_url}
    ${header}=      Create Dictionary   Content-Type=${content_type}
    ${response}=    POST On Session    session    ${endpoint_insert}  json=${request_body}    headers=${header}     expected_status=${status_code}
    [Return]    ${response}
Validate response for
    [Arguments]     ${response}     ${status_code}    ${number_of_rows}
    ${actual_status_code}=     Convert to String   ${response.status_code}
    Should Be Equal    ${actual_status_code}    ${status_code}
Check row num in db
    [Arguments]     ${expected_number_of_rows}
    ${response}=    GET On Session    session    ${endpoint_taxrelief}
    ${number_of_rows_from_db}=    Evaluate    len(${response.content})
    ${number_of_rows_from_db}=    Convert To String    ${number_of_rows_from_db}
    Should Be Equal    ${number_of_rows_from_db}    ${expected_number_of_rows}
Setup drivers
    [Arguments]     ${browser}
    IF  "${browser}"=="Chrome"
        Set Environment Variable    ${chromeWebdriver}    ${chromeDriverLocation}
    ELSE IF     "${browser}"=="Firefox"
        Set Environment Variable    ${firefoxWebdriver}    ${firefoxDriverLocation}
    ELSE IF     "${browser}"=="edge"
        Set Environment Variable    ${edgeWebdriver}    ${edgeDriverLocation}
    END
Open browser and navigate to url
    [Arguments]     ${browser}
    Create Session    session    ${base_url}
    Open Browser    ${base_url}     ${browser}
    Wait Until Element Is Visible    ${websiteElementIsVisibleXPath}      timeout=5
Teardown
    POST On Session     session     ${teardown_rake}
    Close Browser