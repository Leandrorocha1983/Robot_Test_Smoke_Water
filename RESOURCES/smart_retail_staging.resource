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

Verificar se o login é "Smart Retail"
    Click                 selector=//div[@class='MuiAvatar-root MuiAvatar-circular MuiAvatar-colorDefault css-1ywl3ov']   
    Get Element           selector=//h6[contains(.,'qa.smart@grouplinknetwork.com')]
    Get Element           selector=//h5[contains(.,'QA Group Link Smart')]
    Get Element           selector=//li[contains(.,'Profile')]
    Get Element           selector=//div[@class='MuiAvatar-root MuiAvatar-circular MuiAvatar-colorDefault css-uxt7gp']
    Get Element           selector=//span[contains(.,'Message Center')]
    Get Element           selector=//span[contains(.,'Online campaigns')]
    Get Element States    //button[contains(.,'create campaign')]    validate    value & visible
    Get Element           selector=//div[contains(@class,'afJCn gl-send-message')]
    Get Element           selector=//div[contains(@class,'lTRrl')]
    Get Element           selector=//div[contains(@class,'KqNQt')]
    Get Element States    //button[contains(.,'here')]        validate    value & visible
    Get Element           selector=//span[contains(.,'© 2024 Group Link™. All rights reserved')]
    Get Element           selector=//a[contains(.,'Privacy')]
    Get Element           selector=//a[contains(.,'Terms')]

Clicar no botão "create campaign"
    Click                 selector=//button[contains(.,'create campaign')]    
    Get Element           selector=//h4[contains(.,'Create a campaign')]
    Get Element           selector=//button[contains(.,'1. Segmentation')]
    Get Element           selector=//button[contains(.,'2. Message Content')]
    Get Element           selector=//button[contains(.,'3. Schedule')]
    Get Element           selector=//button[contains(.,'4. Review Info')]
    Get Element           selector=//div[@class='sc-kOHTFB jeTfPh']
    Get Element           selector=//strong[contains(.,'Set Source Apps')]
    Get Element           selector=//p[contains(.,'Select at least one mobile app to be the sender')]
    Get Element           selector=//div[contains(@class,'contAnyApp')]
    Get Element           selector=//strong[contains(.,'Choose Audience')]
    Get Element           selector=//p[contains(.,'Add at least one GL Spot to your audience')]
    Get Element           selector=//div[@class='audienceRightCont']
    Get Element           selector=//div[contains(@class,'IwaC5')]
    Get Element           selector=//button[contains(.,'Select All')]
    Get Element           selector=//div[contains(@class,'9kZ7u false')]
    



