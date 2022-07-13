*** Settings ***
Resource    Home.robot 
Library  SeleniumLibrary

*** Variables ***
${CONTACTUS_TEXT_TITULO}        xpath=//*[@id="center_column"]/h1
${CONTACTUS_COMBO_SUBJECT}      xpath=//*[@id="id_contact"]
${CONTACTUS_TEXT_EMAIL}         xpath=//*[@id="email"]
${CONTACTUS_TEXT_ORDEM}         xpath=//*[@id="id_order"]
${CONTACTUS_TEXT_MESSAGE}       xpath=//*[@id="message"]
${CONTACTUS_BUTTTON_SEND}       xpath=//*[@name="submitMessage"]
${CONTACTUS_ALERTA_SUCESSO}     xpath=//*[@class="alert alert-success"]
${CONTACTUS_ALERTA_ERRO}        xpath=//*[@id="center_column"]/div/ol/li

*** Keywords ***
Então é exibida a pagina contact us com a mensagem "${mensagem}"
    Set Suite Variable          ${mensagem}
    Element Text Should Be      ${CONTACTUS_TEXT_TITULO}        ${mensagem}    
    Gerar evidencia teste 

Dado que estou na tela de contact us
    HOME.Dado que estou na pagina home  
    HOME.Quando eu clico no botão contact us
    Então é exibida a pagina contact us com a mensagem "${mensagem}"
    Gerar evidencia teste

Quando enviar uma mensagem "${messagem}"
    Select From List By Value      ${CONTACTUS_COMBO_SUBJECT}       2
    Input Text                     ${CONTACTUS_TEXT_EMAIL}          Vanderlan@test.com.br  
    Input Text                     ${CONTACTUS_TEXT_ORDEM}          4545
    Input Text                     ${CONTACTUS_TEXT_MESSAGE}        ${messagem}      
    Click Element                  ${CONTACTUS_BUTTTON_SEND}
    Gerar evidencia teste

Quando enviar uma mensagem "${messagem}" sem o preenchimento do campo email
    Select From List By Value      ${CONTACTUS_COMBO_SUBJECT}       2
    Input Text                     ${CONTACTUS_TEXT_EMAIL}          ""
    Input Text                     ${CONTACTUS_TEXT_ORDEM}          4545
    Input Text                     ${CONTACTUS_TEXT_MESSAGE}        ${messagem}      
    Click Element                  ${CONTACTUS_BUTTTON_SEND}
    Gerar evidencia teste

Então é exibida a mensagem de sucesso "${mensagemSucesso}"
    Wait Until Element Is Visible        ${CONTACTUS_ALERTA_SUCESSO}   
    Element Text Should Be               ${CONTACTUS_ALERTA_SUCESSO}       ${mensagemSucesso}     False
    Gerar evidencia teste

Então é exibida a mensagem de erro "${mensagemErro}"
    Wait Until Element Is Visible        ${CONTACTUS_ALERTA_ERRO}   
    Element Text Should Be               ${CONTACTUS_ALERTA_ERRO}          ${mensagemErro}
    Gerar evidencia teste




