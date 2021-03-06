*** Settings ***
Library    SeleniumLibrary    plugins=SeleniumTestability;True;30 Seconds;True

*** Variables ***
${header_login_button}    xpath=//a[contains(@class,'button') and contains(@class,'header__login')]
${user_navigation_icon_header_menu_item}    xpath=//div[contains(@class,'user-navigation__user-name')]
${user_navigation_fly_out_header_menu_item}    xpath=//li[contains(@class,'user-navigation__item--user')]//nav[contains(@class,'user-navigation__sub-nav')]//ul[contains(@class,'list--secondary')]
${company_name_icon_header_menu_item}    xpath=//div[@class='header__top']//a[contains(@class,'navigation-top__company')]
${company_account_navigation_fly_out_header_menu_item}    xpath=//div[@class='header__top']//a[contains(@class,'navigation-top__company')]/..//nav[contains(@class,'navigation-list')]/ul
${price_mode_switcher_header_menu_item}    name=price-mode
${currency_switcher_header_menu_item}    name=currency-iso-code
${language_switcher_header_menu_item}    xpath=//*[@class='header__top']//*[@data-qa='component language-switcher']//select
${quick_order_icon_header_menu_item}    xpath=//*[contains(@class,'icon--quick-order')]/ancestor::a
${shopping_list_icon_header_menu_item}    xpath=//*[contains(@class,'icon--header-shopping-list')]/ancestor::a
${shopping_list_sub_navigation_widget}    xpath=//*[contains(@class,'icon--header-shopping-list')]/ancestor::li//div[contains(@class,'js-user-navigation__sub-nav-shopping-list')]
${shopping_list_sub_navigation_all_lists_button}    //*[contains(@class,'icon--header-shopping-list')]/ancestor::li//div[contains(@class,'js-user-navigation__sub-nav-shopping-list')]//a[contains(.,'All Shopping Lists')]
${shopping_list_sub_navigation_create_list_button}    xpath=//*[contains(@class,'icon--header-shopping-list')]/ancestor::li//div[contains(@class,'js-user-navigation__sub-nav-shopping-list')]//a[contains(.,'Create New List')]
${shopping_car_icon_header_menu_item}    xpath=//*[contains(@class,'icon--cart')]/ancestor::a
${shopping_cart_sub_navigation_widget}    xpath=//*[contains(@class,'icon--cart')]/ancestor::li//div[contains(@class,'js-user-navigation__sub-nav-cart')]
${shopping_cart_sub_navigation_all_carts_button}    //*[contains(@class,'icon--cart')]/ancestor::li//div[contains(@class,'js-user-navigation__sub-nav-cart')]//a[contains(.,'All Carts')]
${shopping_cart_sub_navigation_create_cart_button}    xpath=//*[contains(@class,'icon--cart')]/ancestor::li//div[contains(@class,'js-user-navigation__sub-nav-cart')]//a[contains(.,'Create New Cart')]
${search_form_header_menu_item}    xpath=//div[@data-qa="component search-form"][@data-search-id="desktop"]//input[@type='text'][@name='q']
${agent_customer_search_widget}    xpath=//autocomplete-form[@data-qa='component autocomplete-form']//input[contains(@class,'autocomplete-form')][@type='text']
${agent_confirm_login_button}    xpath=//agent-control-bar[@data-qa='component agent-control-bar']//button[contains(@class,'button--success')]
${agent_quote_requests_header_item}    xpath=//agent-control-bar//a[contains(@href,'quote-request')]/ancestor::li[contains(@class,'menu__item--has-children')]
${agent_quote_requests_widget}    xpath=//agent-control-bar//a[contains(@href,'quote-request')]/ancestor::li[contains(@class,'menu__item--has-children')]//ul[contains(@class,'menu--wider')]
  


    
