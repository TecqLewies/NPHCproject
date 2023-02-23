*** Settings ***
Resource    ${CURDIR}/../Modules/UserStory4Utility.robot
Resource    ${CURDIR}/../TestingData/US4Data.robot

Test Template   Validate tax relief records

Test Teardown   POST On Session     session     ${teardown_rake}
*** Keywords ***
Validate tax relief records
    [Documentation]     Test cases in this US4.robot file seeks to test the algorithm for the tax relief caclulation.
    ...     Parameters are varied and used to calculate an expected tax relief amount, which is used to validate against the actual tax relief amount retrieved from the API
    [Arguments]  ${base_url}     ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code}    ${number_of_rows}
    ${request_body}=   Build single person data to dictionary        ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}
    ${response}=    Call API endpoint      ${base_url}     ${request_body}  ${content_type_json}    ${endpoint_insert}         ${status_code}
    Validate response for   ${response}     ${status_code}    ${number_of_rows}
    Check row num in db     ${number_of_rows}
    ${expectedValuesAsDict}=    Calculate Tax Relief   ${request_body}
    Validate Tax Relief Data    ${expectedValuesAsDict}
*** Test Cases ***
Valid data age:18   ${base_url}     ${birthdayAge18}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_valid}     ${single}
    [Tags]  Functional  Positive    Smoke   US4     AgeFilter
Valid data age:19   ${base_url}     ${birthdayAge19}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_valid}     ${single}
    [Tags]  Functional  Positive    Smoke   US4     AgeFilter
Valid data age:35   ${base_url}     ${birthdayAge35}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_valid}     ${single}
    [Tags]  Functional  Positive    Smoke   US4     AgeFilter
Valid data age:36   ${base_url}     ${birthdayAge36}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_valid}     ${single}
    [Tags]  Functional  Positive    Smoke   US4     AgeFilter
Valid data age:50   ${base_url}     ${birthdayAge50}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_valid}     ${single}
    [Tags]  Functional  Positive    Smoke   US4     AgeFilter
Valid data age:51   ${base_url}     ${birthdayAge51}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_valid}     ${single}
    [Tags]  Functional  Positive    Smoke   US4     AgeFilter
Valid data age:75   ${base_url}     ${birthdayAge75}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_valid}     ${single}
    [Tags]  Functional  Positive    Smoke   US4     AgeFilter
Valid data age:76   ${base_url}     ${birthdayAge76}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_valid}     ${single}
    [Tags]  Functional  Positive    Smoke   US4     AgeFilter
Invalid data age:150   ${base_url}     ${birthdateTooFarInPast}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US4     AgeFilter
Invalid data birthday in future   ${base_url}     ${birthdateInFuture}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US4     AgeFilter
Invalid data age too small   ${base_url}     ${birthdateAgeTooYoung}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US4     AgeFilter
Invalid data birthday invalid format   ${base_url}     ${birthdayInvalidFormat}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US4     AgeFilter
Invalid data birthday is special characters   ${base_url}     ${birthdaySpecialChar}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US4     AgeFilter
Invalid data birthday is characters   ${base_url}     ${birthdayChar}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US4     AgeFilter

Valid data gender:M   ${base_url}     ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_valid}     ${single}
    [Tags]  Functional  Positive    Smoke   US4     GenderFilter
Valid data gender:F   ${base_url}     ${birthday}     ${gender2}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_valid}     ${single}
    [Tags]  Functional  Positive    Smoke   US4     GenderFilter
Valid data gender:m   ${base_url}     ${birthday}     ${genderm}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_valid}     ${single}
    [Tags]  Functional  Positive    Smoke   US4     GenderFilter
Valid data gender:f   ${base_url}     ${birthday}     ${genderf}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_valid}     ${single}
    [Tags]  Functional  Positive    Smoke   US4     GenderFilter
Invalid data invalid gender:W   ${base_url}     ${birthday}     ${genderW}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US4     GenderFilter
Invalid data invalid gender:Male   ${base_url}     ${birthday}     ${genderMale}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US4     GenderFilter
Invalid data invalid gender:Female   ${base_url}     ${birthday}     ${genderFemale}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US4     GenderFilter
Invalid data gender is digits   ${base_url}     ${birthday}     ${genderNum}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US4     GenderFilter
Invalid data gender is special char   ${base_url}     ${birthday}     ${genderSpecialChar}   ${name}     ${natid}    ${salary}   ${tax}  ${content_type_json}    ${endpoint_insert}      ${status_code_invalid}     ${empty}
    [Tags]  Functional  Negative   US4     GenderFilter

Valid data relief with decimal .00   ${base_url}     ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${tax.00}  ${content_type_json}    ${endpoint_insert}      ${status_code_valid}     ${single}
    [Tags]  Functional  Positive   US4     RoundingFilter
Valid data relief with decimal .01   ${base_url}     ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${tax.01}  ${content_type_json}    ${endpoint_insert}      ${status_code_valid}     ${single}
    [Tags]  Functional  Positive    Smoke   US4     RoundingFilter
Valid data relief with decimal .26   ${base_url}     ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${tax.26}  ${content_type_json}    ${endpoint_insert}      ${status_code_valid}     ${single}
    [Tags]  Functional  Positive   US4     RoundingFilter
Valid data relief with decimal .49   ${base_url}     ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${tax.49}  ${content_type_json}    ${endpoint_insert}      ${status_code_valid}     ${single}
    [Tags]  Functional  Positive    Smoke   US4     RoundingFilter
Valid data relief with decimal .50   ${base_url}     ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${tax.50}  ${content_type_json}    ${endpoint_insert}      ${status_code_valid}     ${single}
    [Tags]  Functional  Positive    Smoke   US4     RoundingFilter
Valid data relief with decimal .51   ${base_url}     ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${tax.51}  ${content_type_json}    ${endpoint_insert}      ${status_code_valid}     ${single}
    [Tags]  Functional  Positive   US4     RoundingFilter
Valid data relief with decimal .74   ${base_url}     ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${tax.74}  ${content_type_json}    ${endpoint_insert}      ${status_code_valid}     ${single}
    [Tags]  Functional  Positive   US4     RoundingFilter
Valid data relief with decimal .99   ${base_url}     ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${tax.99}  ${content_type_json}    ${endpoint_insert}      ${status_code_valid}     ${single}
    [Tags]  Functional  Positive    Smoke   US4     RoundingFilter

Valid data relief: 0   ${base_url}     ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${tax10000}  ${content_type_json}    ${endpoint_insert}      ${status_code_valid}     ${single}
    [Tags]  Functional  Positive    Smoke   US4     MinReliefFilter
Valid data relief: 1   ${base_url}     ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${tax9999}  ${content_type_json}    ${endpoint_insert}      ${status_code_valid}     ${single}
    [Tags]  Functional  Positive    Smoke   US4     MinReliefFilter
Valid data relief: 49   ${base_url}     ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${tax9951}  ${content_type_json}    ${endpoint_insert}      ${status_code_valid}     ${single}
    [Tags]  Functional  Positive   US4     MinReliefFilter
Valid data relief: 50  ${base_url}     ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${tax9950}  ${content_type_json}    ${endpoint_insert}      ${status_code_valid}     ${single}
    [Tags]  Functional  Positive   US4     MinReliefFilter
Valid data relief: 51   ${base_url}     ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${tax9949}  ${content_type_json}    ${endpoint_insert}      ${status_code_valid}     ${single}
    [Tags]  Functional  Positive    Smoke   US4     MinReliefFilter
Valid data relief: -1   ${base_url}     ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${tax10001}  ${content_type_json}    ${endpoint_insert}      ${status_code_valid}     ${single}
    [Tags]  Functional  Negative   US4     MinReliefFilter