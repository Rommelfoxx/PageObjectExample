*** Settings ***
Library    SeleniumLibrary


*** Variable ***
${BROWSER}    chrome
${URL}        http://automationpractice.com/


*** Keywords ***

Abrir navegador
        Open Browser    url:${URL}    ${BROWSER}


Fechar navegador
        Close Browser
