
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
### Padrões foram utilizados : 
Os arquivos foram segregados nos seguintes diretorios. 

<b>RESOURCE</b>

Keywords, variaveis e Locator separados por arquivos dentro do diretorio Resource/PO conforme pagina HTML que esta faz parte.

Variaveis segue padrão de nomeclatura ${Nome da page_Tipo de objeto}, em maiusculo se for uma variavel global. 

Locator devem estar dentro de variaveis.

<b>TEST-CASE</b>

Cenarios de testes escritos seguindo BDD.

Comentarios referindo historia correspondente ao cenario.

Arquivo Test-case por funcionalidade.

<b>RESULTS</b>

Arquivos de resultados devem ficar neste diretorio. 
------------------------------------------------------------------------------------------------------------------------------
