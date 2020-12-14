*** Settings ***
Resource          ../resource/pages/home.robot
Resource          ../resource/resource.robot
resource          ../resource/pages/Sign.robot
resource          ../resource/pages/cadastro.robot
resource          ../resource/pages/account.robot
Test Setup        Abrir navegador
Test Teardown     Fechar navegador


*** Test Cases ***
#Historia XXX
Cenario 1: Abrir tela de cadastro
    Dado que estou na pagina home
    Quando seleciono Sign
    Entao E Apresentada Tela De Sign

#Historia XXX
Cenario 2: Acessar formulario para novo cadastro
    Dado que estou na pagina de Sign
    Quando informo o email "V@A.COM" para cadastro
    Então é apresentado formulario de cadastro

#Historia XXX
Cenario 3:Preencher formulario para novo cadastro
    Dado que estou na tela de cadastro
    Quando preencho as informações corretamente   Thiago
    Então o cadastro ocorre com sucesso

#Historia XXX
#Cenario 4:Acessar formulario para novo cadastro incorreto
#   Dado que estou na tela de cadastro
#   Quando informo o email "fernando@riachuelo.com.br" para cadastro
#   Cadastro.Então é exibida a mensagem de erro "There are 8 errors"    
