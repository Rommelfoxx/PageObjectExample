*** Settings ***
Resource   Home.robot
Library    SeleniumLibrary
Library    String

*** Variables ***
${Sign-IN_URL}                    http://automationpractice.com/index.php?controller=authentication&back=my-account
${Sign-IN_PAGE_HEAD}              xpath=//*[@class="page-heading"]
${Sign-IN_FIELD_EMAIL}            xpath=//*[@id="email_create"]
${Sign-IN_BUTTON_SUBMIT}          xpath=//*[@id="SubmitCreate"]
${Sign-IN_FIELD_EMAIL_LOGIN}      xpath=//*[@id="email"]
${Sign-IN_FIELD_SENHA_LOGIN}      xpath=//*[@id="passwd"]
${Sign-IN_BUTTON_SUBMIT_LOGIN}    xpath=//*[@id="SubmitLogin"]
${Sign-IN_ALERTA_ERRO}            xpath=//*[@id="center_column"]/div[1]/ol/li
${Sign-IN_ALERTA_SUCESSO}         xpath=//*[@id="header"]/div[2]/div/div/nav/div[1]/a/span


*** Keywords ***
#PRE-CONDICÇÃO
Dado que estou na pagina de Sign
      Home.Dado que estou na pagina home
      Home.Quando seleciono Sign
      Sign.Entao E Apresentada Tela De Sign
      Gerar evidencia teste

#EXECUÇÃO

Quando informo o email "${Sign-IN_EMAIL_TEXT}" para cadastro
      ${Sign-IN_EMAIL_TEXT}=     Generate Random String
      Input Text       ${Sign-IN_FIELD_EMAIL}     ${Sign-IN_EMAIL_TEXT}@a.com
      Click Element    ${Sign-IN_BUTTON_SUBMIT}
      set selenium IMPLICIT WAIT  5
      Gerar evidencia teste

#VALIDAÇÃO
Entao E Apresentada Tela De Sign
      Element Should Contain    ${Sign-IN_PAGE_HEAD}    AUTHENTICATION
      set selenium IMPLICIT WAIT  5
      ${text}=    Generate Random String     8
      Capture Page Screenshot     ${text}.png
      Gerar evidencia teste

#AUTENTICAÇÃO COM ERRO
Quando preencho as informações com erro
      Input Text       ${Sign-IN_FIELD_EMAIL_LOGIN}     teste@riachuelo.com.br
      Input password   ${Sign-IN_FIELD_SENHA_LOGIN}     abacaxi     
      Click Element    ${Sign-IN_BUTTON_SUBMIT_LOGIN}
      Gerar evidencia teste

Então é exibida a mensagem de erro "${mensagemErro}"
    Wait Until Element Is Visible        ${Sign-IN_ALERTA_ERRO}   
    Element Text Should Be               ${Sign-IN_ALERTA_ERRO}          ${mensagemErro}
    Gerar evidencia teste

#AUTENTICAÇÃO COM SUCESSO
Sign.Quando preencho os campos email "${e-mail}" e senha "${senha}"
      Input Text       ${Sign-IN_FIELD_EMAIL_LOGIN}     ${e-mail}
      Input password   ${Sign-IN_FIELD_SENHA_LOGIN}     ${senha}     
      Click Element    ${Sign-IN_BUTTON_SUBMIT_LOGIN}
      Gerar evidencia teste

Então é exibido o nome do Usuário no cabeçalho "${nomeCabecalho}"
    Wait Until Element Is Visible        ${Sign-IN_ALERTA_SUCESSO}   
    Element Text Should Be               ${Sign-IN_ALERTA_SUCESSO}          ${nomeCabecalho}
    Gerar evidencia teste

