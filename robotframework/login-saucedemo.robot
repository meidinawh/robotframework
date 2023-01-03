*** Settings ***
Library            SeleniumLibrary
Suite Setup        Open Browser      ${WebSauceDemo}    ${BROWSER}
Suite Teardown     Close Browser 

*** Variables ***
${WebSauceDemo}     https://www.saucedemo.com/
${BROWSER}          Chrome
${Usernamefield}    id=user-name
${Passwordfield}    id=password
${Loginbutton}      id=login-button

*** Keywords ***
Open Browser to WebSauceDemo
    Open Browser    ${WebSauceDemo}    ${BROWSER}

Closing the Browser
    Close Browser

Input Username
    Input Text      ${Usernamefield}   standard_user

Input Password
    Input Text      ${Passwordfield}   secret_sauce

Click Button Login
    Click Element   ${Loginbutton} 
    Sleep    1s

Verify on Homepage
    Page Should Contain                Sauce Labs Backpack

*** Test Cases ***
user Login with valid username and password
    Open Browser to WebSauceDemo
    Input Username
    Input Password
    Click Button Login
    Verify on Homepage