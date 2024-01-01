*** Keywords ***
Tirar Print
    Take Screenshot

*** Settings ***
Resource            ../RESOURCES/dashboard_staging.resource
Suite Teardown      Close Browser    All
Test Teardown       Tirar Print
    

*** Test Cases ***
Acessar a home page do site Grouplinknetwork "STAGING"
    [Tags]    Página inicial group link network
    Abrir o navegador
    Ir para o site dashboard group link network
    Clicar no "accept cookies policy"
    Verificar se o título da página fica "Group Link - Dashboard"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    Verificar se aparece a frase "GROUP LINK TM"
    Verificar se aparece a frase "Sign in to Group Link"
    Verificar se aparece a frase "Email"
    Verificar se aparece a frase "Password"
    Verificar se aparece a frase "By logging in, you agree to the Terms of Service and our Privacy Policy"
    Verificar se aparece a frase "© 2021 Group Link™. All rights reserved"
    Verificar se aparece a frase "need help?"
    Verificar se aparece a frase "Forgot Password?"
    Verificar se aparece a frase "log in"
    Digitar o "Email" no campo Type your email
    Digitar o "Password" no campo Type your passoword
    Clicar no botão de "log in"

Login com sucesso Group Link Network "STAGING"
    [Tags]    Logado na página Group Link Letwork
    Abrir o navegador
    Ir para o site dashboard group link network
    Clicar no "accept cookies policy" 
    Digitar o "Email" no campo Type your email
    Digitar o "Password" no campo Type your passoword
    Clicar no botão de "log in"
    Conferir se o usuário está logado com sucesso

Página Device List "STAGING"
    [Tags]    Tela Device List
    Abrir o navegador
    Ir para o site dashboard group link network
    Clicar no "accept cookies policy" 
    Digitar o "Email" no campo Type your email
    Digitar o "Password" no campo Type your passoword
    Clicar no botão de "log in"
    Selecionar o "GL Utilities Device List"
    
Página Event List "STAGING" 
    [Tags]    Tela Event List 
    Abrir o navegador
    Ir para o site dashboard group link network
    Clicar no "accept cookies policy" 
    Digitar o "Email" no campo Type your email
    Digitar o "Password" no campo Type your passoword
    Clicar no botão de "log in"  
    Selecionar o "GL Utilities Event List"

Página Event List "Selected All" 
    [Tags]    Tela Event List Selected All
    Abrir o navegador
    Ir para o site dashboard group link network
    Clicar no "accept cookies policy" 
    Digitar o "Email" no campo Type your email
    Digitar o "Password" no campo Type your passoword
    Clicar no botão de "log in"  
    Selecionar o "GL Utilities Event List"
    Selecionar o Event List "Selected All, Off, Relative time ranges"





    