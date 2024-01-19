*** Keywords ***
Tirar Print
    Take Screenshot

*** Settings ***
Resource            ../RESOURCES/smart_retail_staging.resource
Suite Teardown      Close Browser    All
Test Teardown       Tirar Print
    

*** Test Cases ***
Acessar a home page do site Group Link Smart Retail "STAGING"
    [Tags]    Página inicial GL Smart Retail
    Abrir o navegador
    Ir para o site dashboard group link network
    Clicar no "accept cookies policy"
    Digitar o "Email" no campo Type your email
    Digitar o "Password" no campo Type your passoword
    Clicar no botão de "log in"
    Verificar se o título da página fica "Group Link - Dashboard" 

Login com sucesso GL Smart Retail "STAGING"
    [Tags]    Logado na página GL Smart Retail
    Abrir o navegador
    Ir para o site dashboard group link network
    Clicar no "accept cookies policy"
    Digitar o "Email" no campo Type your email
    Digitar o "Password" no campo Type your passoword
    Clicar no botão de "log in"
    Verificar se o login é "Smart Retail"

Página Message Center GL Smart Retail "STAGING"
    [Tags]    Página GL Message Center
    Abrir o navegador
    Ir para o site dashboard group link network
    Clicar no "accept cookies policy"
    Digitar o "Email" no campo Type your email
    Digitar o "Password" no campo Type your passoword
    Clicar no botão de "log in"
    Clicar no botão "create campaign"
