*** Settings ***
Resource    ${CURDIR}/../Modules/UserStory5Utility.robot

Test Template   Check button

Test Teardown   Run Keyword    Teardown
*** Keywords ***
Check button
    [Documentation]     Test cases in this US5.robot file are aimed to test the webelements visible on the UI of the tax relief portal
    ...     and the subsequent redirection to another webpage
    [Arguments]     ${browser}
    Setup drivers    ${browser}
    Open browser and navigate to url        ${browser}
    Check button color      ${browser}
    Check button text
    Click button and validate text
*** Test Cases ***
Check button via edge     ${driver_edge}
    [Tags]  Functional  Positive    Smoke   US5     Edge
Check button via Firefox     ${driver_firefox}
    [Tags]  Functional  Positive    Smoke   US5     Firefox
Check button via Chrome     ${driver_chrome}
    [Tags]  Functional  Positive    Smoke   US5     Chrome