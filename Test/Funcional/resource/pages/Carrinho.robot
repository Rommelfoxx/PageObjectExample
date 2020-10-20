*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${HOME_URL}              http://automationpractice.com/
${CARRINHO_FIELD}        XPATH=//*[@id="layer_cart_product_title"]

*** Keywords ***
#Pre-condição


#Execução


#Validação

Então é apresentado o carrinho contendo "${CARRINHO_TEXT}"
        Element Should Contain    ${CARRINHO_FIELD}      ${CARRINHO_TEXT}
        SET SELENIUM IMPLICIT WAIT   5
