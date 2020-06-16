*** Settings ***
Resource    ../Pages/Yves/Yves_Shopping_Carts_page.robot
Resource    ../Pages/Yves/Yves_Shopping_Cart_page.robot

*** Keywords ***
Yves: 'Shopping Carts' widget contains:
    [Arguments]    ${shoppingCartName}    ${accessLevel}
    Wait Until Element Is Visible    ${shopping_car_icon_header_menu_item} 
    Mouse Over    ${shopping_car_icon_header_menu_item} 
    Wait Until Element Is Visible    ${shopping_cart_sub_navigation_widget}
    Page Should Contain Element    xpath=//*[contains(@class,'icon--cart')]/ancestor::li//div[contains(@class,'js-user-navigation__sub-nav-cart')]//span[text()[contains(.,'${accessLevel}')]]/ancestor::div[@class='mini-cart-detail']//a/*[text()='${shoppingCartName}']

Go to 'Shopping Carts' page
    Mouse Over    ${shopping_car_icon_header_menu_item}
    Wait Until Page Contains Element    ${shopping_cart_sub_navigation_widget}
    Click Element    ${shopping_cart_sub_navigation_all_carts_button}
    Wait For Document Ready    

Yves: create new 'Shopping Cart' with name:
    [Arguments]    ${shoppingCartName}
    Click Element    ${create_shopping_cart_button}
    Wait For Document Ready
    Input Text    ${shopping_cart_name_input_field}    ${shoppingCartName}
    Click Element    ${create_new_cart_submit_button}
    Wait For Document Ready    

Yves: the following shopping cart is shown:
    [Arguments]    ${shoppingCartName}    ${shoppingCartAccess}
    Page Should Contain Element    xpath=//*[@data-qa='component quote-table']//table//td[@data-content='Access'][contains(.,'${shoppingCartAccess}')]/../td[@data-content='Name'][contains(.,'${shoppingCartName}')]

Yves: share shopping cart with user:    
    [Arguments]    ${shoppingCartName}    ${customerToShare}    ${accessLevel}
    Share shopping cart with name:    ${shoppingCartName}
    Select access level to share shopping cart with:    ${customerToShare}    ${accessLevel}
    Click Element    ${share_shopping_cart_confirm_button}
    Yves: 'Shopping Carts' page is displayed
    Yves: flash message 'should' be shown

Yves: go to the shopping cart through the header with name:
    [Arguments]    ${shoppingCartName}
    Wait Until Element Is Visible    ${shopping_car_icon_header_menu_item} 
    Mouse Over    ${shopping_car_icon_header_menu_item} 
    Wait Until Element Is Visible    ${shopping_cart_sub_navigation_widget}
    Click Element    //*[contains(@class,'icon--cart')]/ancestor::li//div[contains(@class,'js-user-navigation__sub-nav-cart')]//div[@class='mini-cart-detail']//a/*[text()='${shoppingCartName}']
    
Yves: shopping cart contains the following products:
    [Arguments]    @{sku_list}    ${sku1}=${EMPTY}     ${sku2}=${EMPTY}     ${sku3}=${EMPTY}     ${sku4}=${EMPTY}     ${sku5}=${EMPTY}     ${sku6}=${EMPTY}     ${sku7}=${EMPTY}     ${sku8}=${EMPTY}     ${sku9}=${EMPTY}     ${sku10}=${EMPTY}     ${sku11}=${EMPTY}     ${sku12}=${EMPTY}     ${sku13}=${EMPTY}     ${sku14}=${EMPTY}     ${sku15}=${EMPTY}
    ${sku_list_count}=   get length  ${sku_list}
    FOR    ${index}    IN RANGE    0    ${sku_list_count}
        ${sku_to_check}=    Get From List    ${sku_list}    ${index}
        Page Should Contain Element    xpath=//main[contains(@class,'cart-page')]//div[contains(@class,'product-card-item__col--description')]//div[contains(.,'SKU: ${sku_to_check}')]/ancestor::article
    END    
    
Yves: click on the '${buttonName}' button
    Run Keyword If    '${buttonName}' == 'Checkout'    Click Element    ${shopping_cart_checkout_button}
    ...    ELSE IF    '${buttonName}' == 'Request a Quote'    Click Element    ${shopping_cart_request_quote_button}