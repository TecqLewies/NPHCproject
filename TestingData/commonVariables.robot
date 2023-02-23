*** Variables ***
#Connection and endpoints
${base_url}=    http://localhost:8080
${endpoint_insert}=     /calculator/insert
${endpoint_insertMultiple}=    /calculator/insertMultiple
${endpoint_taxrelief}=  /calculator/taxRelief
${teardown_rake}=   /calculator/rakeDatabase

#Payload content type
${content_type_json}=   application/json
${content_type_xml}=    application/xml

#Valid input data
${birthday}=  01012007
${gender}=  M
${name}=    Lewies
${natid}=   s12345678a
${salary}=  10000
${tax}=     1000

${birthday2}=  01012001
${gender2}=  F
${name2}=    TesterA
${natid2}=   s87654321b
${salary2}=  5000
${tax2}=     6000

#Number of rows of data in db expected
${single}=      1
${multiple}=    2
${empty}=       0

#Status code expected
${status_code_valid}=   202
${status_code_invalid}=     500
${status_code_unsupportedMediaType}=    415

#Browsers to be used
${driver_chrome}=   Chrome
${driver_firefox}=  Firefox
${driver_edge}=     edge

#UI messages
${noRecordsMessage}=    No records at the moment

#Invalid data
${birthdayEmpty}=
${birthdayInvalidFormat}=   20200101
${birthdayChar}=    abcdabab
${birthdaySpecialChar}=     !@#$!@!@
${birthdateInFuture}=   01012030
${birthdateTooFarInPast}=   01011873
${birthdateAgeTooYoung}=    01012018
${genderEmpty}=
${genderMale}=  Male
${genderW}=     W
${genderNum}=   123
${genderSpecialChar}=   !@#
${nameEmpty}=
${nameNum}=     123
${nameSpecialChar}=     !@#
${natidEmpty}=
${natidSpecialChar}=    !@#
${salaryEmpty}=
${salaryChar}=      abcd
${salarySpecialChar}=   !@#
${taxEmpty}=
${taxChar}=     abcd
${taxSpecialChar}=      !@#