*** Settings ***
Resource   home.robot
Library    SeleniumLibrary
Library    String

*** Variables ***
${SIGN_IN_URL}                    http://automationpractice.com/index.php?controller=authentication&back=my-account
${SIGN_IN_PAGE_HEAD}              xpath=//*[@class="page-heading"]
${SIGN_IN_FIELD_EMAIL}            xpath=//*[@id="email_create"]
${SIGN_IN_BUTTON_SUBMIT}          xpath=//*[@id="SubmitCreate"]
${SIGN_IN_FIELD_EMAIL_LOGIN}      xpath=//*[@id="email"]
${SIGN_IN_FIELD_SENHA_LOGIN}      xpath=//*[@id="passwd"]
${SIGN_IN_BUTTON_SUBMIT_LOGIN}    xpath=//*[@id="SubmitLogin"]
${SIGN_IN_ALERTA_ERRO}            xpath=//*[@id="center_column"]/div[1]/ol/li
${SIGN_IN_ALERTA_SUCESSO}         xpath=//*[@id="header"]/div[2]/div/div/nav/div[1]/a/span


*** Keywords ***
#PRE-CONDICÇÃO
Dado que estou na pagina de Sign
      Home.Dado que estou na pagina home
      Home.Quando seleciono Sign
      Sign.Entao E Apresentada Tela De Sign
      Gerar evidencia teste

#EXECUÇÃO

Quando informo o email para cadastro
      ${SIGN_IN_EMAIL_TEXT}=     Generate Random String
      Input Text       ${SIGN_IN_FIELD_EMAIL}     ${SIGN_IN_EMAIL_TEXT}@a.com
      Click Element    ${SIGN_IN_BUTTON_SUBMIT}
      set selenium IMPLICIT WAIT  5
      Gerar evidencia teste

#VALIDAÇÃO
Entao E Apresentada Tela De SIGN
      Element Should Contain    ${SIGN_IN_PAGE_HEAD}    AUTHENTICATION
      set selenium IMPLICIT WAIT  5
      ${text}=    Generate Random String     8
      Capture Page Screenshot     ${text}.png
      Gerar evidencia teste

#AUTENTICAÇÃO COM ERRO
Quando preencho as informações com erro
      Input Text       ${SIGN_IN_FIELD_EMAIL_LOGIN}     teste@riachuelo.com.br
      Input password   ${SIGN_IN_FIELD_SENHA_LOGIN}     abacaxi     
      Click Element    ${SIGN_IN_BUTTON_SUBMIT_LOGIN}
      Gerar evidencia teste

Então é exibida a mensagem de erro "${mensagemErro}"
    Wait Until Element Is Visible        ${SIGN_IN_ALERTA_ERRO}   
    Element Text Should Be               ${SIGN_IN_ALERTA_ERRO}          ${mensagemErro}
    Gerar evidencia teste

#AUTENTICAÇÃO COM SUCESSO
SIGN.Quando preencho os campos email "${e-mail}" e senha "${senha}"
      Input Text       ${SIGN_IN_FIELD_EMAIL_LOGIN}     ${e-mail}
      Input password   ${SIGN_IN_FIELD_SENHA_LOGIN}     ${senha}     
      Click Element    ${SIGN_IN_BUTTON_SUBMIT_LOGIN}
      Gerar evidencia teste

Então é exibido o nome do Usuário no cabeçalho "${nomeCabecalho}"
    Wait Until Element Is Visible        ${SIGN_IN_ALERTA_SUCESSO}   
    Element Text Should Be               ${SIGN_IN_ALERTA_SUCESSO}          ${nomeCabecalho}
    Gerar evidencia teste

