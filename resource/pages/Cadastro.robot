*** Settings ***


*** Variables ***

${CADASTRO_NAVIGATION_PAGE}      //*[@class="navigation_page"]
${CADASTRO_GENERO}               //*[@id="id_gender1"]
${CADASTRO_FIRTNAME}             //*[@id="customer_firstname"]
${CADASTRO_LASTNAME}             //*[@id="customer_lastname"]
${CADASTRO_E-MAIL}               //*[@id="email"]
${CADASTRO_SENHA}                //*[@id="passwd"]
${CADASTRO_DIA}                  //*[@id="days"]
${CADASTRO_MES}                  //*[@id="months"]
${CADASTRO_ANO}                  //*[@id="years"]
${CADASTRO_FIRTNAME_ADDRESS}     //*[@id="firstname"]
${CADASTRO_LASTNAME_ADDRESS}     //*[@id="lastname"]
${CADASTRO_COMPANY}              //*[@id="company"]
${CADASTRO_ADDRESS}              //*[@id="address1"]
${CADASTRO_CITY}                 //*[@id="city"]
${CADASTRO_STATE}                //*[@id="id_state"]
${CADASTRO_POSTCODE}             //*[@id="postcode"]
${CADASTRO_COUNTRY}              //*[@id="id_country"]
${CADASTRO_PHONE_MOBILE}         //*[@id="phone_mobile"]
${CADASTRO_ALIAS}                //*[@id="alias"]
${CADASTRO_BUTTON_SUBMIT}        //*[@id="submitAccount"]

${CADASTRO_ALERTA_ERRO}           xpath=//*[@id="center_column"]/div/p

*** Keywords ***
#Pré-Condição
Dado que estou na tela de cadastro
    Sign.Dado que estou na pagina de Sign
    Sign.Quando informo o email "${Sign-IN_EMAIL_TEXT}" para cadastro
    Então é apresentado formulario de cadastro
    Gerar evidencia teste

#EXECUÇÃO

Quando preencho as informações corretamente
      [Arguments]   ${name}=Vanderlan   ${last_name}=Alves  ${senha}=hentai    ${dia}=3    ${mes}=9    ${ano}=1983    ${fist_name_adress}=Vanderlan   ${last_name_adress}=Alves   ${company}=CLARO    ${adress}=Godofredo Fraga   ${city}=São Paulo   ${state}=40    ${postcode}=05475   ${country}=21    ${phone_mobile}=970164830   ${alias}=Casa
      click Element                    ${CADASTRO_GENERO}
      Input Text                       ${CADASTRO_FIRTNAME}           ${name}
      Input Text                       ${CADASTRO_LASTNAME}           ${last_name}
      Input Text                       ${CADASTRO_SENHA}              ${senha}
      Select From List By Value        ${CADASTRO_DIA}                ${dia}
      Select From List By Value        ${CADASTRO_MES}                ${mes}
      Select From List By Value        ${CADASTRO_ANO}                ${ano}
      Input Text                       ${CADASTRO_FIRTNAME_ADDRESS}   ${fist_name_adress}
      Input Text                       ${CADASTRO_LASTNAME_ADDRESS}   ${last_name_adress}
      Input Text                       ${CADASTRO_COMPANY}            ${company}
      Input Text                       ${CADASTRO_ADDRESS}            ${adress}
      Input Text                       ${CADASTRO_CITY}               ${city}
      Select From List By Value        ${CADASTRO_STATE}              ${state}
      Input Text                       ${CADASTRO_POSTCODE}           ${postcode}
      Select From List By Value        ${CADASTRO_COUNTRY}            ${country}
      Input Text                       ${CADASTRO_PHONE_MOBILE}       ${phone_mobile}
      Input Text                       ${CADASTRO_ALIAS}              ${alias}
      CLICK Button                     ${CADASTRO_BUTTON_SUBMIT}
      set selenium IMPLICIT WAIT       5
      Gerar evidencia teste

#Validação
Então é apresentado formulario de cadastro
    Element Should Contain   ${CADASTRO_NAVIGATION_PAGE}    Authentication
    Gerar evidencia teste

Então é exibida a mensagem de erro "${mensagemErro}"
    Wait Until Element Is Visible        ${CADASTRO_ALERTA_ERRO}   
    Element Text Should Be               ${CADASTRO_ALERTA_ERRO}          ${mensagemErro}   
    Gerar evidencia teste 