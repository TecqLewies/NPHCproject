*** Settings ***
Resource    ${CURDIR}/../Modules/UserStory2Utility.robot

Test Template   Insert multiple persons

Test Teardown   POST On Session     session     ${teardown_rake}
*** Keywords ***
Insert multiple persons
    [Documentation]     Test cases in this US2.robot file seeks to test the endpoint /calculator/insertMultiple
    ...     A request body is generated according to testcase, and is sent to the endpoint. The response will then be validated
    [Arguments]  ${base_url}     ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}    ${birthday2}     ${gender2}   ${name2}     ${natid2}    ${salary2}   ${tax2}  ${content_type}    ${endpoint_insert}      ${status_code}    ${number_of_rows}
    ${request_body}=    Create list from provided data      ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}      ${birthday2}     ${gender2}   ${name2}     ${natid2}    ${salary2}   ${tax2}
    ${response}=    Call API endpoint      ${base_url}     ${request_body}  ${content_type}    ${endpoint_insert}      ${status_code}
    Validate response for   ${response}     ${status_code}    ${number_of_rows}
    Check row num in db     ${number_of_rows}
*** Test Cases ***
Valid data   ${base_url}    ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}     ${birthday2}     ${gender2}   ${name2}     ${natid2}    ${salary2}   ${tax2}  ${content_type_json}    ${endpoint_insertMultiple}      ${status_code_valid}     ${multiple}
    [Tags]  Functional  Positive    Smoke   US2
Invalid data: Invalid headerType  ${base_url}    ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}     ${birthday2}     ${gender2}   ${name2}     ${natid2}    ${salary2}   ${tax2}  ${content_type_xml}    ${endpoint_insertMultiple}      ${status_code_unsupportedMediaType}     ${empty}
    [Tags]  Functional  Negative   US2
Invalid data: Empty multiple persons data   ${base_url}    ${birthdayEmpty}     ${genderEmpty}   ${nameEmpty}     ${natidEmpty}    ${salaryEmpty}   ${taxEmpty}     ${birthdayEmpty}     ${genderEmpty}   ${nameEmpty}     ${natidEmpty}    ${salaryEmpty}   ${taxEmpty}  ${content_type_json}    ${endpoint_insertMultiple}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US2
Invalid data: Empty single person data  ${base_url}    ${birthdayEmpty}     ${genderEmpty}   ${nameEmpty}     ${natidEmpty}    ${salaryEmpty}   ${taxEmpty}     ${birthday2}     ${gender2}   ${name2}     ${natid2}    ${salary2}   ${tax2}  ${content_type_json}    ${endpoint_insertMultiple}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US2
Invalid data: Missing field birthday    ${base_url}    ${birthdayEmpty}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}     ${birthday2}     ${gender2}   ${name2}     ${natid2}    ${salary2}   ${tax2}  ${content_type_json}    ${endpoint_insertMultiple}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US2
Invalid data: Missing field gender  ${base_url}    ${birthday}     ${genderEmpty}   ${name}     ${natid}    ${salary}   ${tax}     ${birthday2}     ${gender2}   ${name2}     ${natid2}    ${salary2}   ${tax2}  ${content_type_json}    ${endpoint_insertMultiple}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US2
Invalid data: Missing field name    ${base_url}    ${birthday}     ${gender}   ${nameEmpty}     ${natid}    ${salary}   ${tax}     ${birthday2}     ${gender2}   ${name2}     ${natid2}    ${salary2}   ${tax2}  ${content_type_json}    ${endpoint_insertMultiple}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US2
Invalid data: Missing field natid   ${base_url}    ${birthday}     ${gender}   ${name}     ${natidEmpty}    ${salary}   ${tax}     ${birthday2}     ${gender2}   ${name2}     ${natid2}    ${salary2}   ${tax2}  ${content_type_json}    ${endpoint_insertMultiple}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US2
Invalid data: Missing field salary  ${base_url}    ${birthday}     ${gender}   ${name}     ${natid}    ${salaryEmpty}   ${tax}     ${birthday2}     ${gender2}   ${name2}     ${natid2}    ${salary2}   ${tax2}  ${content_type_json}    ${endpoint_insertMultiple}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US2
Invalid data: Missing field tax     ${base_url}    ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${taxEmpty}     ${birthday2}     ${gender2}   ${name2}     ${natid2}    ${salary2}   ${tax2}  ${content_type_json}    ${endpoint_insertMultiple}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US2
Invalid data: Invalid date format   ${base_url}    ${birthdayInvalidFormat}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}     ${birthday2}     ${gender2}   ${name2}     ${natid2}    ${salary2}   ${tax2}  ${content_type_json}    ${endpoint_insertMultiple}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US2
Invalid data: Invalid date char  ${base_url}    ${birthdayChar}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}     ${birthday2}     ${gender2}   ${name2}     ${natid2}    ${salary2}   ${tax2}  ${content_type_json}    ${endpoint_insertMultiple}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US2
Invalid data: Invalid date !@#  ${base_url}    ${birthdaySpecialChar}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}     ${birthday2}     ${gender2}   ${name2}     ${natid2}    ${salary2}   ${tax2}  ${content_type_json}    ${endpoint_insertMultiple}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US2
Invalid data: Invalid gender Male   ${base_url}    ${birthday}     ${genderMale}   ${name}     ${natid}    ${salary}   ${tax}     ${birthday2}     ${gender2}   ${name2}     ${natid2}    ${salary2}   ${tax2}  ${content_type_json}    ${endpoint_insertMultiple}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US2
Invalid data: Invalid gender W  ${base_url}    ${birthday}     ${genderW}   ${name}     ${natid}    ${salary}   ${tax}     ${birthday2}     ${gender2}   ${name2}     ${natid2}    ${salary2}   ${tax2}  ${content_type_json}    ${endpoint_insertMultiple}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US2
Invalid data: Invalid gender 123    ${base_url}    ${birthday}     ${genderNum}   ${name}     ${natid}    ${salary}   ${tax}     ${birthday2}     ${gender2}   ${name2}     ${natid2}    ${salary2}   ${tax2}  ${content_type_json}    ${endpoint_insertMultiple}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US2
Invalid data: Invalid gender !@#    ${base_url}    ${birthday}     ${genderSpecialChar}   ${name}     ${natid}    ${salary}   ${tax}     ${birthday2}     ${gender2}   ${name2}     ${natid2}    ${salary2}   ${tax2}  ${content_type_json}    ${endpoint_insertMultiple}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US2
Invalid data: Invalid name 123  ${base_url}    ${birthday}     ${gender}   ${nameNum}     ${natid}    ${salary}   ${tax}     ${birthday2}     ${gender2}   ${name2}     ${natid2}    ${salary2}   ${tax2}  ${content_type_json}    ${endpoint_insertMultiple}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US2
Invalid data: Invalid name !@#  ${base_url}    ${birthday}     ${gender}   ${nameSpecialChar}     ${natid}    ${salary}   ${tax}     ${birthday2}     ${gender2}   ${name2}     ${natid2}    ${salary2}   ${tax2}  ${content_type_json}    ${endpoint_insertMultiple}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US2
Invalid data: Invalid natid !@# ${base_url}    ${birthday}     ${gender}   ${name}     ${natidSpecialChar}    ${salary}   ${tax}     ${birthday2}     ${gender2}   ${name2}     ${natid2}    ${salary2}   ${tax2}  ${content_type_json}    ${endpoint_insertMultiple}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US2
Invalid data: Invalid salary abcd   ${base_url}    ${birthday}     ${gender}   ${name}     ${natid}    ${salaryChar}   ${tax}     ${birthday2}     ${gender2}   ${name2}     ${natid2}    ${salary2}   ${tax2}  ${content_type_json}    ${endpoint_insertMultiple}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US2
Invalid data: Invalid salary !@#    ${base_url}    ${birthday}     ${gender}   ${name}     ${natid}    ${salarySpecialChar}   ${tax}     ${birthday2}     ${gender2}   ${name2}     ${natid2}    ${salary2}   ${tax2}  ${content_type_json}    ${endpoint_insertMultiple}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US2
Invalid data: Invalid tax abcd  ${base_url}    ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${taxChar}     ${birthday2}     ${gender2}   ${name2}     ${natid2}    ${salary2}   ${tax2}  ${content_type_json}    ${endpoint_insertMultiple}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US2
Invalid data: Invalid tax !@#   ${base_url}    ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${taxSpecialChar}     ${birthday2}     ${gender2}   ${name2}     ${natid2}    ${salary2}   ${tax2}  ${content_type_json}    ${endpoint_insertMultiple}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US2
Logical error: Birthdate too far in past    ${base_url}    ${birthdateTooFarInPast}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}     ${birthday2}     ${gender2}   ${name2}     ${natid2}    ${salary2}   ${tax2}  ${content_type_json}    ${endpoint_insertMultiple}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US2
Logical error: Birthdate in the future  ${base_url}    ${birthdateInFuture}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}     ${birthday2}     ${gender2}   ${name2}     ${natid2}    ${salary2}   ${tax2}  ${content_type_json}    ${endpoint_insertMultiple}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US2
Logical error: Age too young    ${base_url}    ${birthdateAgeTooYoung}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}     ${birthday2}     ${gender2}   ${name2}     ${natid2}    ${salary2}   ${tax2}  ${content_type_json}    ${endpoint_insertMultiple}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US2
Logical error: Record already exists    ${base_url}    ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}     ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insertMultiple}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US2