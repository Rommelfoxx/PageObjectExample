*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${HOME_URL}                    http://automationpractice.com/
${HOME_TITLE_TEXT}             My Store
${HOME_SEARCH_BOX}             xpath=//*[@id="search_query_top"]
${HOME_BUTOON_SEARCH}          xpath=//*[@id="searchbox"]/button
${HOME_TEXT_CONSULTA}          xpath=//*[@id="center_column"]/h1/span[1]
${HOME_ADD_CARD}               xpath=//*[@title="Add to cart"]
${HOME_LINK_CONTACTUS}         xpath=//*[@title="Contact Us"]
${HOME_BUTTON_SIGIN}           xpath=//a[@class="login"]


*** Keywords ***
#Pre-condição
Dado que estou na pagina home
      Go To    ${HOME_URL}
      SET SELENIUM IMPLICIT WAIT   5
      Title Should Be    ${HOME_TITLE_TEXT}


#Execução
Quando pesquiso por "${HOME_PRODUTO}"
      Input Text    ${HOME_SEARCH_BOX}    ${HOME_PRODUTO}
      Click Button    ${HOME_BUTOON_SEARCH}
      SET SELENIUM IMPLICIT WAIT   5


Quando adiciono "${HOME_PRODUTO}" no carrinho
      Quando pesquiso por "${HOME_PRODUTO}"
      SET SELENIUM IMPLICIT WAIT   5
      Click Element    ${HOME_ADD_CARD}
      SET SELENIUM IMPLICIT WAIT   2

Quando seleciono Sign-in
      Click Element   ${HOME_BUTTON_SIGIN}
      set selenium IMPLICIT WAIT  5

Quando eu clico no botão contact us
      Click Element     ${HOME_LINK_CONTACTUS}
      

#Validação

Então a pagina de consulta é aberta com o resultado "${HOME_PRODUTO}"
      SET SELENIUM IMPLICIT WAIT   5
      Element Should Contain    ${HOME_TEXT_CONSULTA}      ${HOME_PRODUTO}
