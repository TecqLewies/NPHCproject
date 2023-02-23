*** Settings ***
Resource    ${CURDIR}/../Modules/commonKeyword.robot
Test Template   Insert single record

Test Teardown   POST On Session     session     ${teardown_rake}
*** Keywords ***
Insert single record
    [Documentation]     Test cases in this US1.robot file seeks to test the endpoint /calculator/insert
    ...     A request body is generated according to testcase, and is sent to the endpoint. The response will then be validated
    [Arguments]  ${base_url}     ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code}    ${number_of_rows}
    ${request_body}=    Build single person data to dictionary    ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}
    ${response}=    Call API endpoint      ${base_url}     ${request_body}  ${content_type_json}    ${endpoint_insert}      ${status_code}
    Validate response for   ${response}     ${status_code}    ${number_of_rows}
    Check row num in db     ${number_of_rows}
*** Test Cases ***
Valid data   ${base_url}     ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_valid}     ${single}
    [Tags]  Functional  Positive    Smoke   US1
Invalid headerType  ${base_url}     ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_xml}    ${endpoint_insert}      ${status_code_unsupportedMediaType}     ${empty}
    [Tags]  Functional  Negative   US1
Invalid data: empty request body  ${base_url}     ${birthdayEmpty}     ${genderEmpty}   ${nameEmpty}     ${natidEmpty}    ${salaryEmpty}   ${taxEmpty}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US1
Invalid data: empty field birthday  ${base_url}     ${birthdayEmpty}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US1
Invalid data: empty field gender  ${base_url}     ${birthday}     ${genderEmpty}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US1
Invalid data: empty field name  ${base_url}     ${birthday}     ${gender}   ${nameEmpty}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US1
Invalid data: empty field natid  ${base_url}     ${birthday}     ${gender}   ${name}     ${natidEmpty}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US1
Invalid data: empty field salary  ${base_url}     ${birthday}     ${gender}   ${name}     ${natid}    ${salaryEmpty}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US1
Invalid data: empty field tax  ${base_url}     ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${taxEmpty}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US1
Invalid data: invalid date format  ${base_url}     ${birthdayInvalidFormat}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US1
Invalid data: invalid date char  ${base_url}     ${birthdayChar}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US1
Invalid data: invalid date !@#  ${base_url}     ${birthdaySpecialChar}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US1
Invalid data: invalid gender Male  ${base_url}     ${birthday}     ${genderMale}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US1
Invalid data: invalid gender W  ${base_url}     ${birthday}     ${genderW}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US1
Invalid data: invalid gender 123  ${base_url}     ${birthday}     ${genderNum}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US1
Invalid data: invalid gender !@#  ${base_url}     ${birthday}     ${genderSpecialChar}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US1
Invalid data: invalid name 123  ${base_url}     ${birthday}     ${gender}   ${nameNum}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US1
Invalid data: invalid name !@#  ${base_url}     ${birthday}     ${gender}   ${nameSpecialChar}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US1
Invalid data: invalid natid !@#   ${base_url}     ${birthday}     ${gender}   ${name}     ${natidSpecialChar}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US1
Invalid data: invalid salary abcd  ${base_url}     ${birthday}     ${gender}   ${name}     ${natid}    ${salaryChar}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US1
Invalid data: invalid salary !@#  ${base_url}     ${birthday}     ${gender}   ${name}     ${natid}    ${salarySpecialChar}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US1
Invalid data: invalid tax abcd  ${base_url}     ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${taxChar}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US1
Invalid data: invalid tax !@#  ${base_url}     ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${taxSpecialChar}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US1
Logical error: Birthdate too far in past    ${base_url}     ${birthdateTooFarInPast}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US1
Logical error: Birthdate in the future  ${base_url}     ${birthdateInFuture}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US1
Logical error: Age too young    ${base_url}     ${birthdateAgeTooYoung}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US1