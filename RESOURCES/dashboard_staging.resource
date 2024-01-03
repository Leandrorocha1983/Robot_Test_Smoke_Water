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
    
Verificar se o título da página fica "${TITULOGROUPLINK}"
    ${TITULOGROUPLINK}    Get Title    ==    Group Link - Dashboard

Verificar se aparece a frase "GROUP LINK TM"
    Get Element    selector=//h4[contains(.,'Sign in to Group Link')]

Verificar se aparece a frase "Sign in to Group Link"
    Get Element    selector=//h4[contains(.,'Sign in to Group Link')]

Verificar se aparece a frase "Email"
    Get Element    selector=//label[contains(.,'Email')]

Verificar se aparece a frase "Password"
    Get Element    selector=//label[contains(.,'Password')]

Verificar se aparece a frase "By logging in, you agree to the Terms of Service and our Privacy Policy"
    Get Element    selector=//h6[contains(.,'By logging in, you agree to the Terms of Service and our Privacy Policy')]

Verificar se aparece a frase "© 2021 Group Link™. All rights reserved"
    Get Element    selector=//p[contains(.,'© 2021 Group Link™. All rights reserved')]

Verificar se aparece a frase "need help?"
    Get Element    selector=//button[contains(.,'need help?')]

Verificar se aparece a frase "Forgot Password?"
    Get Element    selector=//button[contains(.,'Forgot Password?')]

Verificar se aparece a frase "log in"
    Get Element    selector=//button[contains(.,'log in')]

Digitar o "Email" no campo Type your email
    Fill Text    css=input[type="email"]   txt=qa.water@grouplinknetwork.com

Digitar o "Password" no campo Type your passoword
    Fill Text    css=input[type="password"]    txt=fzveqtsdkukz

Clicar no botão de "log in"
    Click    selector=//button[contains(.,'log in')]
Conferir se o usuário está logado com sucesso
    Get Element States    //span[contains(.,'Devices')]    validate    value & visible
Selecionar o "GL Utilities Device List"
    Click                  selector=//html[1]/body[1]/div[1]/div[3]/div[3]/div[3]/table[1]/tbody[1]/tr[1]/td[7]/div[1]/td[1]/div[1]/div[1]
    Get Element States     //div[@data-cy='device-list-get-device-by-period-7d-0']    validate    value & visible
    Click                  selector=//div[@data-cy='device-list-get-device-by-period-3d-0']
    Get Element States     //div[@data-cy='device-list-get-device-by-period-3d-0']
    Click                  selector=//div[@data-cy='device-list-get-device-by-period-15d-0']
    Get Element States     //div[@data-cy='device-list-get-device-by-period-15d-0']
    Click                  selector=//div[@data-cy='device-list-get-device-by-period-30d-0']
    Get Element States     //div[@data-cy='device-list-get-device-by-period-30d-0']
    Get Element            selector=//th[contains(.,'Device ID')]
    Get Element            selector=//th[contains(.,'Remote ID')]
    Get Element            selector=//th[contains(.,'Name')]
    Get Element            selector=//th[contains(.,'Activation')]
    Get Element            selector=//th[contains(.,'Last Event')]
    Get Element            selector=//th[contains(.,'Device Location')]
    Get Element            selector=//th[contains(.,'Alerts')]

Selecionar o "GL Utilities Event List"    
    Click                  selector=//button[contains(.,'Events')]    
    Get Element            (//span[@class='eventList_title__n6WMO'][contains(.,'Event List')])[1]
    Click                  selector=//button[@data-cy='dropDownButton-select-columns'][contains(.,'SelectedAll')]   
    Click                  //label[@for='All'][contains(.,'All')]     
    Click                  //label[@for='delta-2'][contains(.,'Delta')]  
    Click                  //label[@for='deviceId-3'][contains(.,'Device ID')]    
    Click                  //label[@for='liters-5'][contains(.,'Volume')]
    Click                  (//button[@class='refreshSelector_dropdown__iYwtB'][contains(.,'Off')])[1]   
    Click                  //button[@class='refreshSelector_dropOption__9KRbw'][contains(.,'30 sec')]
    Click                  (//button[@class='eventDateCard_dateButton__yTXz5'][contains(.,'Last 30 minutes')])[1]
    Click                  (//button[contains(.,'apply date range')])[1]
    Click                  (//button[contains(.,'Last 5 minutes')])[1]
    Get Element            selector=(//p[contains(.,'Event Created')])[1]
    Get Element            selector=//p[contains(.,'Event Sent')]
    Get Element            selector=//p[contains(.,'Delta')]
    Get Element            selector=//div[contains(@class,'PB4cB MuiBox-root css-0')]
    Get Element            selector=//p[contains(.,'RSSI')]
    Get Element            selector=//p[contains(.,'Volume')]
    Get Element            selector=//p[contains(.,'Channel')]

Selecionar o Event List "Selected All, Off, Relative time ranges"
    Click                  selector=//button[contains(.,'SelectedAll')]
    Click                  selector=//label[contains(.,'All')]   
    Get Text               selector=//span[contains(.,'Columns')]
    Get Text               selector=//span[contains(.,'(0)')] 
    Click                  selector=//label[contains(.,'Event Created')]    
    Click                  selector=//button[contains(.,'Done')]
    Get Text               selector=//div[@class='dropdownCheckboxSecondary_left__wQnFN'][contains(.,'Selected(1)')]
    Get Element States     (//p[contains(.,'Event Created')])[1]    validate    value & visible

Selecionar o "GL Utilities Reports"
    Click                  selector=//button[contains(.,'Reports')]
    Click                  selector=//button[contains(.,'new report')]
    Fill Text              selector=//input[contains(@placeholder,'Report Name')]    txt=QaTeste 
    Click                  selector=//input[@value='Select'] 
    Click                  selector=//div[@aria-label='Choose Wednesday, January 3rd, 2024']
    Click                  selector=//button[contains(.,'Done')]
   





    


    