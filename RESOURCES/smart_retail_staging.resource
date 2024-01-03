*** Settings ***
Library    Browser
# ...        Timeout=00:00:30
...        enable_presenter_mode=${true}
Library    FakerLibrary
Library    DateTime
Library    Screenshot



*** Variables ***
${BROWSER}                        chromium
${HEADLESS}                       ${False} 
${SITE_DASHBOARD_STAGING}         https://dashboard-s.grouplinknetwork.com/login
${Get Cookies}                    //h5[@class='MuiTypography-root MuiTypography-h5 css-i6vjuv'][contains(.,'accept all cookies')]
                  


*** Keywords ***  
Abrir o navegador
    New Browser    browser=${BROWSER}
    ...            headless=${HEADLESS}
   

    ${TRACE_NAME}    FakerLibrary.Uuid 4
    ${NOW}           Get Current Date    result_format=%d-%m-%y_%H%m%S
    New Context      viewport={'width': 1345, 'height': 610}
    ...              tracing=${OUTPUT_DIR}/evidencies/traces/${NOW}/${TRACE_NAME}.zip
    # ...              recordVideo={'dir':'${OUTPUT_DIR}/evidencies/videos/${NOW}'}

Ir para o site dashboard group link network
    ${old_timeout} =    Set Browser Timeout    1m 30 seconds
    New Page       url=${SITE_DASHBOARD_STAGING}
    Set Browser Timeout    ${old_timeout}  

Clicar no "accept cookies policy"  
    Click    selector=${Get Cookies} 
Digitar o "Email" no campo Type your email
    Fill Text    css=input[type="email"]   txt=qa.smart@grouplinknetwork.com

Digitar o "Password" no campo Type your passoword
    Fill Text    css=input[type="password"]    txt=fzveqtsdkukz

Clicar no botão de "log in"
    Click    selector=//button[contains(.,'log in')]      
Verificar se o título da página fica "${TITULOGROUPLINK}"
    ${TITULOGROUPLINK}    Get Title    ==    Group Link - Dashboard  