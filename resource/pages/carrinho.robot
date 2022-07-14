*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${HOME_URL}              http://automationpractice.com/
${CARRINHO_FIELD}        XPATH=//*[@class="lighter"]


*** Keywords ***

Então é apresentado o carrinho contendo "${CARRINHO_TEXT}"
        Element Should Contain    ${CARRINHO_FIELD}      ${CARRINHO_TEXT}
        SET SELENIUM IMPLICIT WAIT   5
        Gerar evidencia teste
        



