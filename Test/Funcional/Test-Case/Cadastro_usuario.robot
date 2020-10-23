*** Settings ***
Resource          ../resource/pages/home.robot
Resource          ../resource/resource.robot
resource          ../resource/pages/autenticacao.robot
resource          ../resource/pages/cadastro.robot
resource          ../resource/pages/account.robot
Test Setup        Abrir navegador
Test Teardown     Fechar navegador

*** Variables ***


*** Test Cases ***
#Historia XXX
Cenario 1: Abrir tela de cadastro
    Dado que estão na pagina HOME
    Quando seleciono Sign-in
    Entao E Apresentada Tela De Autenticacao

Cenario 2: Acessar formulario para novo cadastro
    Dado que estou na pagina de autenticação
    Quando informo o email "V@A.COM" para cadastro
    Então é apresentado formulario de cadastro

Cenario 3:Preencher formulario para novo cadastro
    Dado que estou na tela de cadastro
    Quando preencho as informações corretamente   Thiago
    Então o cadsatro ocorre com sucesso