*** Settings ***
Resource    ${CURDIR}/../Modules/UserStory3Utility.robot

Test Template   Working case

Test Teardown   Run Keyword    Teardown
*** Keywords ***
Working case
    [Documentation]     Test cases in this US3.robot file are aimed to test the uploading of files with multiple persons data for different browsers
    ...     The datatable on the webpage and data fetched via API are then used to validate the uploading of files
    [Arguments]     ${fileName}     ${browser}
    Setup drivers    ${browser}
    Open browser and navigate to url        ${browser}
    Upload file and refresh table   ${fileName}
    Validate row numbers        ${expected_row_number}
    Check row num in db    ${expected_row_number}
*** Test Cases ***
Testing for files upload edge     ${file}    ${driver_edge}
    [Tags]  Functional  Positive    Smoke   US3     Edge
Testing for files upload firefox     ${file}    ${driver_firefox}
    [Tags]  Functional  Positive    Smoke   US3     Firefox
Testing for files upload chrome     ${file}    ${driver_chrome}
    [Tags]  Functional  Positive    Smoke   US3     Chrome






