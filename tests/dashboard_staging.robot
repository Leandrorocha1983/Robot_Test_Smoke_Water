*** Settings ***
Resource            ../RESOURCES/dashboard_staging.resource
Suite Teardown      Close Browser    All
    

*** Test Cases ***
Acessar a home page do site Grouplinknetwork "STAGING"
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

    