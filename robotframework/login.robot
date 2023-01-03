*** Settings ***
Library            SeleniumLibrary
Suite Setup        Open Browser           ${url}        ${BROWSER}
Suite Teardown     Close Browser


*** Variables ***
${BROWSER}         Chrome
${url}             https://dineshvelhal.github.io/testautomation-playground/login.html
${username}        id=user
${password}        id=password
${btnlogin}        id=login
${size}            id=rad_medium
${flavor}          id=select_flavor
${sauce}           id=rad_barbeque
${topping1}        id=onions
${topping2}        id=green_olive
${topping3}        id=tomoto
${quantity}        id=quantity
${submit}          id=submit_button 
${addmassage}      id=added_message

*** Keywords ***
Open browser to the login page           
    Open Browser                    ${url}    ${BROWSER}
    Maximize Browser Window
Input username
    Input Text                      ${username}    admin
Input password
    Input Text                      ${password}    admin
Click login button
    Click Element                   ${btnlogin}  
    Sleep                                          1s
Verify on homepage
    Page Should Contain                            Dinesh's Pizza House  
Choose pizza size
    Click Element                   ${size}
    Sleep                                          1s       
Choose pizza flavor
    Select From List By Label       ${flavor}      Supreme
    Sleep                                          1s
Choose sauce
    Click Element                   ${sauce}
Choose toppings
    Click Element                   ${topping3}
    Click Element                   ${topping1}
    Click Element                   ${topping2}
    Click Element                   ${topping3}
    Sleep                                           1s
Input quantity
    Input Text                      ${quantity}     3    
    Sleep                                           1s   
Click add to cart
    Click Button                    ${submit}
    Sleep                                           5s
Verify success massage
    Wait Until Element Is Visible   ${addmassage} 
    Element Text Should Be          ${addmassage}   Pizza added to the cart!
    Sleep                                           3s

*** Test Cases ***
Add pizza to cart
    Open browser to the login page
    Input username
    Input password
    Click login button
    Verify on homepage
    Choose pizza size
    Choose Pizza Flavor
    Choose sauce
    Choose toppings
    Input quantity
    Click add to cart
    Verify success massage