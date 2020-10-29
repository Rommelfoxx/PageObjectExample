
## Page Object model Test automation framework using Robot framework with pyton.

Projeto para demosntrar padrão de facil manutenção para automações em Robot framework. 

<b>Dependency</b>

Robot Framework

Library SeleniumLibrary

------------------------------------------------------------------------------------------------------------------------------
### Passos para executar os testes

git clone https://github.com/Rommelfoxx/PageObjectExample.git

cd PageObjectExample\test\funcional

robot -d result Test-case\

------------------------------------------------------------------------------------------------------------------------------
### Padrões utilizados : 
Os arquivos foram segregados nos seguintes diretorios. 

<b>RESOURCE</b>

Keywords, variaveis e Locator separados por arquivos dentro do diretorio Resource/PO conforme pagina HTML que esta faz parte.

Variaveis segue padrão de nomeclatura ${Nome da page_Tipo de objeto}, em maiusculo se for uma variavel global. 

Locator devem estar dentro de variaveis.

Variais e Keywords gerais que são utilizados em mais de uma page devem ficar no arquivo Resource.robot.

Keywords que fazem parte de outra pages porem são chamadas por outra keyword devem conter antes de sua definição o nome da page que faz parte inicialmente seguida de ponto.
  Exemplo: Home.Aqui vai o nome da Keyword

<b>TEST-CASE</b>

Cenarios de testes escritos seguindo BDD.

Comentarios referindo historia correspondente ao cenario.

Arquivo Test-case por funcionalidade.

<b>RESULTS</b>

Arquivos de resultados devem ficar neste diretorio. 

------------------------------------------------------------------------------------------------------------------------------
