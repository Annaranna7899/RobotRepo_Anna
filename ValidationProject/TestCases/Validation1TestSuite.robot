*** Settings ***
Library    SeleniumLibrary    
*** Variables ***
${url} =     https://opensource-demo.orangehrmlive.com/
${browser} =     gc

*** Test Cases ***

TC_001_ValidationText
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Input Text    id=txtUsername    Admin    
    Input Password    id=txtPassword    admin123
    Click Button    id=btnLogin    
    #Page Should Contain    Dashboard  
    Page Should Not Contain    Dashboard444          
    Click Element    id=welcome    
    Sleep    2s  
    Click Link    link=Logout    
    Close Window
    

TC_002_ValidationTextField
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    #Page Should Contain Textfield    id=txtUsername   
    Page Should Not Contain Textfield    id=txtUsername233     
    Input Text    id=txtUsername    Admin   
    #Page Should Contain Textfield    id=txtPassword  
    Page Should Not Contain Textfield    id=txtPasswordxx       
    Input Password    id=txtPassword    admin123
    Click Button    id=btnLogin  
    Close Window
    
TC_003_ValidateCheckBox
    Open Browser    https://test.salesforce.com/    gc
    Maximize Browser Window
    Checkbox Should Not Be Selected    id=rememberUn
    Click Element    id=rememberUn    
    Checkbox Should Be Selected    id=rememberUn
    Close Window
    

TC_004_ValidateErrorMessage
    Open Browser    https://test.salesforce.com/    gc
    Maximize Browser Window
    Input Text    id=username    Ad888  
    Input Password    id=password    xxx
    Click Button    id=Login
    Sleep    2s      
    #Element Text Should Be    id=error    Please check your username and password. If you still can't log in, contact your Salesforce administrator.    
    Element Text Should Not Be    id=error    blabla....    
    Element Should Contain    id=error    Please check your username and password 
    Element Should Not Contain    id=error    password4       
    Close Browser
         
TC_005_ValidateTitleElementEnabledVisible
    Open Browser    https://test.salesforce.com/    gc
    Maximize Browser Window
    Title Should Be    Login | Salesforce    
    Element Should Be Enabled    id=username
    #Element Should Be Disabled    id=username
    Element Should Be Visible    id=username    
    Close Browser

TC_006_Display_Simple_Text
    Log To Console    Anna gitHub    
