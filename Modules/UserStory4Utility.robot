*** Settings ***
Library     RequestsLibrary
Library     Collections
Resource    ${CURDIR}/commonKeyword.robot

*** Keywords ***
Calculate Tax Relief
    [Arguments]     ${dict}
    ${item_salary}=      Get From Dictionary     ${dict}     salary
    ${item_tax}=        Get From Dictionary     ${dict}     tax
    ${item_birthday}=        Get From Dictionary     ${dict}     birthday
    ${item_gender}=     Get From Dictionary     ${dict}     gender
    ${item_name}=   Get From Dictionary     ${dict}     name
    ${item_natid}=      Get From Dictionary     ${dict}     natid
    ${item_birthyear}=      Get Substring   ${item_birthday}    -4

    ${gender_bonus}=    Calculate gender bonus      ${item_gender}
    ${age_variable}=    Calculate age variable      ${item_birthyear}
    ${taxRelief}=      Calculate tax relief enhanced       ${item_salary}      ${item_tax}     ${age_variable}     ${gender_bonus}

    ${maskedNatId}=     Build masked natid      ${item_natid}

    ${expectedValues}=      Create Dictionary   name=${item_name}   maskedNatId=${maskedNatId}  expectedTaxRelief=${taxRelief}

    [Return]    ${expectedValues}

Calculate gender bonus
    [Arguments]     ${gender}
    IF  "${gender}"=="M"
        ${gender_bonus}=    Set Variable    0
    ELSE IF     "${gender}"=="m"
        ${gender_bonus}=    Set Variable    0
    ELSE IF  "${gender}"=="F"
        ${gender_bonus}=    Set Variable    500
    ELSE IF  "${gender}"=="f"
        ${gender_bonus}=    Set Variable    500
    ELSE
        ${gender_bonus}=    Set Variable    0
    END

    [Return]    ${gender_bonus}

Calculate age variable
    [Arguments]    ${birthyear}
    TRY
         ${item_age}=        Evaluate    2023-${birthyear}
    EXCEPT
        Pass Execution    msg=Invalid date format
    END

    IF  ${item_age}<=18
        ${age_variable}=    Set Variable    1
    ELSE IF  ${item_age}>18 and ${item_age}<=35
        ${age_variable}=    Set Variable    0.8
    ELSE IF  ${item_age}>35 and ${item_age}<=50
        ${age_variable}=    Set Variable    0.5
    ELSE IF  ${item_age}>50 and ${item_age}<=75
        ${age_variable}=    Set Variable    0.367
    ELSE IF  ${item_age}>75
        ${age_variable}=    Set Variable    0.05
    END

    [Return]    ${age_variable}

Calculate tax relief enhanced
    [Arguments]     ${item_salary}      ${item_tax}     ${age_variable}     ${gender_bonus}
    ${Tax_Relief}=      Evaluate    int((((${item_salary}-${item_tax})*${age_variable})+${gender_bonus})*100)/100.0
    ${Tax_Relief}=      Evaluate    "%.2f" %round(${Tax_Relief})

    IF  ${Tax_Relief}>0 and ${Tax_Relief}<50
        ${Tax_Relief}=  Set Variable    50.00
    END

    [Return]    ${Tax_Relief}

Build masked natid
    [Arguments]     ${natidToBeMasked}
    ${natid_length}=    Get Length    ${natidToBeMasked}
    ${visible_natid}=   Get Substring    ${natidToBeMasked}    0    4
    ${length_to_hide}=  Evaluate    ${natid_length}-4
    ${hidden_characters}=   Set Variable    ${EMPTY}
    FOR     ${i}    IN RANGE    ${length_to_hide}
        ${hidden_characters}    Catenate    SEPARATOR=  ${hidden_characters}    $
    END
    ${hidden_characters}=    Get Substring    ${hidden_characters}    1   7
    ${hidden_natid}=    Catenate    SEPARATOR=  ${visible_natid}    ${hidden_characters}
    [Return]    ${hidden_natid}

Validate Tax Relief Data
    [Arguments]     ${expectedValuesAsDict}
    ${expectedName}=      Get From Dictionary     ${expectedValuesAsDict}     name
    ${maskedNatId}=        Get From Dictionary     ${expectedValuesAsDict}     maskedNatId
    ${expectedTaxRelief}=        Get From Dictionary     ${expectedValuesAsDict}     expectedTaxRelief
    ${expectedTaxRelief}=  Convert To String    ${expectedTaxRelief}

    TRY
        ${response_taxrelief}=      Get On Session     session     ${endpoint_taxrelief}
        ${responsebody_contents}=    Evaluate    json.loads('''${response_taxrelief.content}''')    json
        ${responsebody_content}=     Copy Dictionary    ${responsebody_contents}[0]
    EXCEPT
        Pass Execution    msg=Response body is empty
    END

    Should Be Equal    ${responsebody_content}[natid]    ${maskedNatId}
    Should Be Equal    ${responsebody_content}[relief]     ${expectedTaxRelief}
    Should Be Equal    ${responsebody_content}[name]     ${expectedName}