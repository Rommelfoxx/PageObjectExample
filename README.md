## Page Object model Test automation framework using Robot framework with pyton.

Projeto para demosntrar padrão de facil manutenção para automações em Robot framework. 

<b>Dependency Robot Framework</b>

Library SeleniumLibrary

------------------------------------------------------------------------------------------------------------------------------
### Passos para executar os testes

git clone https://github.com/Rommelfoxx/PageObjectExample.git

cd PageObjectExample\test\funcional

robot -d result Test-case\

------------------------------------------------------------------------------------------------------------------------------
### Quais padrões foram utilizados : 

<b>RESOURCE</b>

Keywords, variaveis e Locator separados por arquivos dentro do diretorio Resource/PO conforme pagina HTML que esta faz parte.

Variaveis segue padrão de nomeclatura ${Nome da page_Tipo de objeto}, em maiusculo se for uma variavel global. 

Locator devem estar dentro de variaveis.


