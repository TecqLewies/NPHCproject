*** Settings ***
Library     Collections
Resource    ${CURDIR}/commonKeyword.robot

*** Keywords ***
Create list from provided data
    [Arguments]     ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}      ${birthday2}     ${gender2}   ${name2}     ${natid2}    ${salary2}   ${tax2}
    ${list}=    Create List
    ${dict1}=   Build single person data to dictionary        ${birthday}     ${gender}   ${name}     ${natid}    ${salary}   ${tax}
    ${dict2}=   Build single person data to dictionary        ${birthday2}     ${gender2}   ${name2}     ${natid2}    ${salary2}   ${tax2}
    Append To List    ${list}   ${dict1}
    Append To List    ${list}   ${dict2}
    [Return]    ${list}