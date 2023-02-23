*** Variables ***
${chooseFileXPath}=     xpath:/html/body/div/div[2]/div/div[1]/div[2]/input
${refreshTaxReliefTableXPath}=      xpath:/html/body/div/div[2]/div/button[1]
${taxReliefTableXPath}=     xpath:/html/body/div/div[2]/div/div[2]/table
${taxReliefTableRowsXPath}=     xpath:/html/body/div/div[2]/div/div[2]/table/tbody/tr
${noRecordsMessageXPath}=   xpath:/html/body/div/div[2]/div/h1
${websiteElementIsVisibleXPath}=    xpath:/html/body/div/div[2]/div/div[1]/div[2]
${dispenseNowButtonXPath}=      xpath:/html/body/div/div[2]/div/a[2]
${cashDispensedXPath}=      xpath:/html/body/div/div/div/main/div/div/div

#Expected row number for uploaded files
${expected_row_number}=     10

#UI messages
${cashDispensedMessage}=    Cash dispensed
${dispenseNowMessage}=      Dispense Now

# Webdriver setup
${edgeWebdriver}=   webdriver.edge.driver
${edgeDriverLocation}=      ${EXECDIR}/../WebDrivers/msedgedriver.exe
${firefoxWebdriver}=    webdriver.gecko.driver
${firefoxDriverLocation}=       ${EXECDIR}/../WebDrivers/geckodriver.exe
${chromeWebdriver}=     webdriver.chrome.driver
${chromeDriverLocation}=        ${EXECDIR}/../WebDrivers/chromedriver.exe

#File names for US3
${file}=    ${CURDIR}\\TestData\\InputDataValid.csv
${invalidFileEmptyFile}=     ${CURDIR}\\TestData\\InputDataInvalidEmptyFile.csv
${invalidFileEmptyRows}=     ${CURDIR}\\TestData\\InputDataInvalidEmptyRows.csv
${invalidFilePDF}=     ${CURDIR}\\TestData\\InputDataValid.pdf
${invalidFileXLS}=     ${CURDIR}\\TestData\\InputDataValid.xls
${invalidFileMissingData}=     ${CURDIR}\\TestData\\InputDataInvalidMissingData.csv
${invalidFileMissingNatid}=     ${CURDIR}\\TestData\\InputDataInvalidMissingNatid.csv
${invalidFileMissingName}=     ${CURDIR}\\TestData\\InputDataInvalidMissingName.csv
${invalidFileMissingGender}=     ${CURDIR}\\TestData\\InputDataInvalidMissingGender.csv
${invalidFileMissingBirthday}=     ${CURDIR}\\TestData\\InputDataInvalidMissingBirthday.csv
${invalidFileMissingSalary}=     ${CURDIR}\\TestData\\InputDataInvalidMissingSalary.csv
${invalidFileMissingTax}=     ${CURDIR}\\TestData\\InputDataInvalidMissingTax.csv
${invalidFileExtraColumn}=     ${CURDIR}\\TestData\\InputDataInvalidExtraColumn.csv
${invalidFileDateInvalidFormat}=     ${CURDIR}\\TestData\\InputDataInvalidDateInvalidFormat.csv
${invalidFileTaxGreaterThanSalary}=     ${CURDIR}\\TestData\\InputDataInvalidTaxGreaterThanSalary.csv
${invalidFileIllogicalBirthdate}=     ${CURDIR}\\TestData\\InputDataInvalidIllogicalBirthdate.csv
${invalidFileRecordAlreadyExists}=     ${CURDIR}\\TestData\\InputDataInvalidRecordAlreadyExists.csv