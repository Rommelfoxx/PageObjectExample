*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${AUTENTICACAO_URL}              http://automationpractice.com/index.php?controller=authentication&back=my-account
${AUTENTICACAO_PAGE_HEAD}        xpath=//*[@class="page-heading"]
${AUTENTICACAO_FIELD_EMAIL}      xpath=//*[@id="email_create"]
${AUTENTICACAO_BUTTON_SUBMIT}    xpath=//*[@id="SubmitCreate"]

${AUTENTICACAO_EMAIL_TEXT}

*** Keywords ***
#PRE-CONDICÇÃO
Dado que estou na pagina de autenticação
      Home.Dado que estou na pagina home
      Home.Quando seleciono Sign-in
      Autenticacao.Entao e apresentada tela de autenticacao
      Gerar evidencia teste
  
#EXECUÇÃO

Quando informo o email "${AUTENTICACAO_EMAIL_TEXT}" para cadastro
      ${AUTENTICACAO_EMAIL_TEXT}=     Generate Random String
      Input Text       ${AUTENTICACAO_FIELD_EMAIL}     ${AUTENTICACAO_EMAIL_TEXT}@a.com
      Click Element    ${AUTENTICACAO_BUTTON_SUBMIT}
      set selenium IMPLICIT WAIT  5
      Gerar evidencia teste

#VALIDAÇÃO
Entao e apresentada tela de autenticacao
      Element Should Contain    ${AUTENTICACAO_PAGE_HEAD}    AUTHENTICATION
      set selenium IMPLICIT WAIT  5
      ${text}=    Generate Random String     8
      Capture Page Screenshot     ${text}.png
      Gerar evidencia teste