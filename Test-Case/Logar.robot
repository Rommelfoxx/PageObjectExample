*** Settings ***
Resource          ../resource/resource.robot
resource          ../resource/pages/Sign.robot
Test Setup        Abrir navegador
Test Teardown     Fechar navegador

*** Test Cases ***
#Historia XXX - Cenário de Erro de Autenticação
Cenario 1: Preencher os campos para logar com erro
    Sign.Dado que estou na pagina de Sign
    Sign.Quando preencho as informações com erro
    Sign.Então é exibida a mensagem de erro "Authentication failed."

#Historia XXX - Cenário de Logar com um usuário válido já cadstrado previamente 
Cenario 2: Preencher os campos para logar com sucesso
    Sign.Dado que estou na pagina de Sign
    Sign.Quando preencho os campos email "fernando.oliveira@riachuelo.com.br" e senha "abacaxi"
    Sign.Então é exibido o nome do Usuário no cabeçalho "Fernando Oliveira"