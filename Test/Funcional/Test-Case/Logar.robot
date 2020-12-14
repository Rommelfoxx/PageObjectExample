*** Settings ***
Resource          ../resource/pages/home.robot
Resource          ../resource/resource.robot
resource          ../resource/pages/Sign.robot
resource          ../resource/pages/cadastro.robot
resource          ../resource/pages/account.robot
Test Setup        Abrir navegador
Test Teardown     Fechar navegador

*** Test Cases ***
#Historia XXX - Cenário de Erro de Autenticação
Cenario 1: Preencher os campos para logar com erro
    Dado que estou na pagina de Sign
    Quando preencho as informações com erro
    Então é exibida a mensagem de erro "Authentication failed."

#Historia XXX - Cenário de Logar com um usuário válido
Cenario 2: Preencher os campos para logar com sucesso
    Dado que estou na pagina de Sign
    #E possuo um email e senha valida
    Quando preencho os campos email e senha
    Então é exibido o nome do Usuário no cabeçalho "Fernando Oliveira"