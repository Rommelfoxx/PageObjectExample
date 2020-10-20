*** Settings ***
library   SeleniumLibrary


*** Variables ***

${ACCOUNT_PAGE_HEAD}     xpath=//*[@id="center_column"]/h1



*** Keywords ***

Então o cadsatro ocorre com sucesso
    Element Should Contain   ${ACCOUNT_PAGE_HEAD}   My account    none    true
