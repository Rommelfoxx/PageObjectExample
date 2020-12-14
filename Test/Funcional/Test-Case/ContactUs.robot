*** Settings ***
Resource            ../resource/resource.robot 
Resource            ../resource/pages/home.robot
Resource            ../resource/pages/contactUs.robot
Suite Setup         Abrir navegador
Suite Teardown      Fechar navegador


*** Test Case ***
Cenario 1: Acessar a tela contactUs
    Dado que estou na pagina home
    Quando eu clico no botão contact us
    Então é exibida a pagina contact us com a mensagem "CUSTOMER SERVICE - CONTACT US"

Cenario 2: Enviar uma mensagem na tela contact us
    Dado que estou na tela de contact us
    Quando enviar uma mensagem "Pedido realizado com sucesso"
    Então é exibida a mensagem de sucesso "Your message has been successfully sent to our team."

Cenario 3: Enviar uma mensagem de erro ao não preencher o campo email
    Dado que estou na tela de contact us
    Quando enviar uma mensagem "Pedido realizado com sucesso" sem o preenchimento do campo email
    Então é exibida a mensagem de erro "Invalid email address."
    