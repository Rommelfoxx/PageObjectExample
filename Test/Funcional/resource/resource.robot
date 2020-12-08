*** Settings ***
Library  SeleniumLibrary


*** Variable ***
${BROWSER}    chrome



*** Keywords ***

Abrir navegador
        Open Browser    url:    ${BROWSER}


Fechar navegador
        Capture Page Screenshot
        Close Browser
        


        

