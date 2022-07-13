*** Settings ***
Library    SeleniumLibrary
Library    String


*** Variable ***
${BROWSER}    chrome



*** Keywords ***
#testes remotos pelo Open Browser
Abrir navegador
    Open Browser    url:    ${BROWSER}    

# testes remotos pelo Webdriver 
#Abrir navegador

    # ${chrome_options}=          Evaluate             sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    # Call Method                 ${chrome_options}    add_argument                                         --disable-extensions
    # Call Method                 ${chrome_options}    add_argument                                         --disable-gpu
    # Call Method                 ${chrome_options}    add_argument                                         --disable-web-security
    # Call Method                 ${chrome_options}    add_argument                                         --no-sandbox
    # Call Method                 ${chrome_options}    add_argument                                         --ignore-certificate-errors
    # Call Method                 ${chrome_options}    add_argument                                         --allow-running-insecure-content
    # Call Method                 ${chrome_options}    add_argument                                         --disable-popup-blocking
    # Call Method                 ${chrome_options}    add_experimental_option                              useAutomationExtension                           False
    # Call Method                 ${chrome_options}    add_argument                                         --allow-insecure-localhost
    # Call Method                 ${chrome_options}    add_argument                                         --no-experiments
    # Call Method                 ${chrome_options}    add_argument                                         --disable-web-security
    # Call Method                 ${chrome_options}    add_argument                                         --no-first-run
    # Call Method                 ${chrome_options}    add_argument                                         --disable-blink-features
    # Call Method                 ${chrome_options}    add_argument                                         --test-type
    # Call Method                 ${chrome_options}    add_argument                                         --disable-infobars
    # Call Method                 ${chrome_options}    add_argument                                         --incognito
    # ${options}=                 Call Method          ${chrome_options}                                    to_capabilities                                  
    # ${executor}=                Evaluate             str('http://localhost:4445/wd/hub')	
    # ${WEBDRIVER}=               Create Webdriver     Remote                                               command_executor=http://localhost:4445/wd/hub    desired_capabilities=${options}    
    # Maximize Browser Window
    # Capture Page Screenshot 
    # # Set Window Size    1500    1500

Fechar navegador
    Close Browser

Pegar o nome da suite de teste
	${suiteName}=	Get Variable Value	${SUITE NAME}
	${suiteName}=	Replace String	${suiteName}	${SPACE}	_
	${suiteName}=	Replace String	${suiteName}	.	_
	${suiteName}=	Replace String	${suiteName}	(	_
	${suiteName}=	Replace String	${suiteName}	)	_
	${suiteName}=	Replace String	${suiteName}	\"	_
	${suiteName}=	Replace String	${suiteName}	:	_
	${suiteName}=	Replace String	${suiteName}	\'	_
                                                         [Return]    ${suiteName}

Pegar o nome do test-case
                                                       ${testName}=	Get Variable Value	${TEST NAME}
	${testName}=	Replace String	${testName}	${SPACE}	_
	${testName}=	Replace String	${testName}	(	_
	${testName}=	Replace String	${testName}	)	_
	${testName}=	Replace String	${testName}	\"	_
	${testName}=	Replace String	${testName}	:	_
	${testName}=	Replace String	${testName}	\'	_
                                                       [Return]                                        ${testName}

Gerar evidencia teste
    ${suite}=                   Pegar o nome da suite de teste
    ${teste}=                   Pegar o nome do test-case
    Set Screenshot Directory    results\\${suite}\\${teste}
    Capture Page Screenshot     



