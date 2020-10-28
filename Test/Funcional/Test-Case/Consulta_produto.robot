*** Settings ***
Resource          ../resource/pages/home.robot
Resource          ../resource/pages/carrinho.robot
Resource          ../resource/resource.robot
Test Setup        Abrir navegador
Test Teardown     Fechar navegador


*** Test Cases ***
##Historia XXX
Cenario 1:Consultar produto existente
    Dado que estão na pagina HOME
    Quando pesquiso por "DRESS"
    Então a pagina de consulta é aberta com o resultado "DRESS"

Cenario 2:Consultar produto nao existente
    Dado que estão na pagina HOME
    Quando pesquiso por "nao existente"
    Então a pagina de consulta é aberta com o resultado "0 results have been found."

Cenario 3:Adicionar produto carrinho
    Dado que estão na pagina HOME
    Quando adiciono "Dress" no carrinho
    Então é apresentado o carrinho contendo "Dress"
