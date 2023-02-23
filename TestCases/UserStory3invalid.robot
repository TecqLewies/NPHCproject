*** Settings ***
Resource    ${CURDIR}/../Modules/UserStory3Utility.robot

Test Template   Invalid case

Test Teardown   Run Keyword    Teardown
*** Keywords ***
Invalid case
    [Documentation]     Test cases in this US3.robot file are aimed to test the uploading of files with multiple persons data for different browsers
    ...     The datatable on the webpage and data fetched via API are then used to validate the uploading of files
    [Arguments]     ${fileName}     ${browser}
    Setup drivers    ${browser}
    Open browser and navigate to url        ${browser}
    Upload file and refresh table   ${fileName}
    Validate no data
*** Test Cases ***
Upload invalid empty file edge    ${invalidFileEmptyFile}    ${driver_edge}
    [Tags]  Functional  Negative   US3     Edge
Upload invalid empty file firefox    ${invalidFileEmptyFile}    ${driver_firefox}
    [Tags]  Functional  Negative   US3     Firefox
Upload invalid empty file chrome     ${invalidFileEmptyFile}    ${driver_chrome}
    [Tags]  Functional  Negative   US3     Chrome

Upload invalid empty rows edge    ${invalidFileEmptyRows}    ${driver_edge}
    [Tags]  Functional  Negative   US3     Edge
Upload invalid empty rows firefox    ${invalidFileEmptyRows}    ${driver_firefox}
    [Tags]  Functional  Negative   US3     Firefox
Upload invalid empty rows chrome     ${invalidFileEmptyRows}    ${driver_chrome}
    [Tags]  Functional  Negative   US3     Chrome

Upload invalid file type pdf edge    ${invalidFilePDF}    ${driver_edge}
    [Tags]  Functional  Negative   US3     Edge
Upload invalid file type pdf firefox    ${invalidFilePDF}    ${driver_firefox}
    [Tags]  Functional  Negative   US3     Firefox
Upload invalid file type pdf chrome     ${invalidFilePDF}    ${driver_chrome}
    [Tags]  Functional  Negative   US3     Chrome

Upload invalid file type xls edge    ${invalidFileXLS}    ${driver_edge}
    [Tags]  Functional  Negative   US3     Edge
Upload invalid file type xls firefox    ${invalidFileXLS}    ${driver_firefox}
    [Tags]  Functional  Negative   US3     Firefox
Upload invalid file type xls chrome     ${invalidFileXLS}    ${driver_chrome}
    [Tags]  Functional  Negative   US3     Chrome

Upload invalid missing data edge    ${invalidFileMissingData}    ${driver_edge}
    [Tags]  Functional  Negative   US3     Edge
Upload invalid missing data firefox    ${invalidFileMissingData}    ${driver_firefox}
    [Tags]  Functional  Negative   US3     Firefox
Upload invalid missing data chrome     ${invalidFileMissingData}    ${driver_chrome}
    [Tags]  Functional  Negative   US3     Chrome

Upload invalid missing natid edge    ${invalidFileMissingNatid}    ${driver_edge}
    [Tags]  Functional  Negative   US3     Edge
Upload invalid missing natid firefox    ${invalidFileMissingNatid}    ${driver_firefox}
    [Tags]  Functional  Negative   US3     Firefox
Upload invalid missing natid chrome     ${invalidFileMissingNatid}    ${driver_chrome}
    [Tags]  Functional  Negative   US3     Chrome

Upload invalid missing name edge    ${invalidFileMissingName}    ${driver_edge}
    [Tags]  Functional  Negative   US3     Edge
Upload invalid missing name firefox    ${invalidFileMissingName}    ${driver_firefox}
    [Tags]  Functional  Negative   US3     Firefox
Upload invalid missing name chrome     ${invalidFileMissingName}    ${driver_chrome}
    [Tags]  Functional  Negative   US3     Chrome

Upload invalid missing gender edge    ${invalidFileMissingGender}    ${driver_edge}
    [Tags]  Functional  Negative   US3     Edge
Upload invalid missing gender firefox    ${invalidFileMissingGender}    ${driver_firefox}
    [Tags]  Functional  Negative   US3     Firefox
Upload invalid missing gender chrome     ${invalidFileMissingGender}    ${driver_chrome}
    [Tags]  Functional  Negative   US3     Chrome

Upload invalid missing birthday edge    ${invalidFileMissingBirthday}    ${driver_edge}
    [Tags]  Functional  Negative   US3     Edge
Upload invalid missing birthday firefox    ${invalidFileMissingBirthday}    ${driver_firefox}
    [Tags]  Functional  Negative   US3     Firefox
Upload invalid missing birthday chrome     ${invalidFileMissingBirthday}    ${driver_chrome}
    [Tags]  Functional  Negative   US3     Chrome

Upload invalid missing salary edge    ${invalidFileMissingSalary}    ${driver_edge}
    [Tags]  Functional  Negative   US3     Edge
Upload invalid missing salary firefox    ${invalidFileMissingSalary}    ${driver_firefox}
    [Tags]  Functional  Negative   US3     Firefox
Upload invalid missing salary chrome     ${invalidFileMissingSalary}    ${driver_chrome}
    [Tags]  Functional  Negative   US3     Chrome

Upload invalid missing tax edge    ${invalidFileMissingTax}    ${driver_edge}
    [Tags]  Functional  Negative   US3     Edge
Upload invalid missing tax firefox    ${invalidFileMissingTax}    ${driver_firefox}
    [Tags]  Functional  Negative   US3     Firefox
Upload invalid missing tax chrome     ${invalidFileMissingTax}    ${driver_chrome}
    [Tags]  Functional  Negative   US3     Chrome

Upload invalid extra column edge    ${invalidFileExtraColumn}    ${driver_edge}
    [Tags]  Functional  Negative   US3     Edge
Upload invalid extra column firefox    ${invalidFileExtraColumn}    ${driver_firefox}
    [Tags]  Functional  Negative   US3     Firefox
Upload invalid extra column chrome     ${invalidFileExtraColumn}    ${driver_chrome}
    [Tags]  Functional  Negative   US3     Chrome

Upload invalid date invalid format edge    ${invalidFileDateInvalidFormat}    ${driver_edge}
    [Tags]  Functional  Negative   US3     Edge
Upload invalid date invalid format firefox    ${invalidFileDateInvalidFormat}    ${driver_firefox}
    [Tags]  Functional  Negative   US3     Firefox
Upload invalid date invalid format chrome     ${invalidFileDateInvalidFormat}    ${driver_chrome}
    [Tags]  Functional  Negative   US3     Chrome

Upload invalid tax greater than salary edge    ${invalidFileTaxGreaterThanSalary}    ${driver_edge}
    [Tags]  Functional  Negative   US3     Edge
Upload invalid tax greater than salary firefox    ${invalidFileTaxGreaterThanSalary}    ${driver_firefox}
    [Tags]  Functional  Negative   US3     Firefox
Upload invalid tax greater than salary chrome     ${invalidFileTaxGreaterThanSalary}    ${driver_chrome}
    [Tags]  Functional  Negative   US3     Chrome

Upload invalid illogical birthdate edge    ${invalidFileIllogicalBirthdate}    ${driver_edge}
    [Tags]  Functional  Negative   US3     Edge
Upload invalid illogical birthdate firefox    ${invalidFileIllogicalBirthdate}    ${driver_firefox}
    [Tags]  Functional  Negative   US3     Firefox
Upload invalid illogical birthdate chrome     ${invalidFileIllogicalBirthdate}    ${driver_chrome}
    [Tags]  Functional  Negative   US3     Chrome

Upload invalid record already exists edge    ${invalidFileRecordAlreadyExists}    ${driver_edge}
    [Tags]  Functional  Negative   US3     Edge
Upload invalid record already exists firefox    ${invalidFileRecordAlreadyExists}    ${driver_firefox}
    [Tags]  Functional  Negative   US3     Firefox
Upload invalid record already exists chrome     ${invalidFileRecordAlreadyExists}    ${driver_chrome}
    [Tags]  Functional  Negative   US3     Chrome
