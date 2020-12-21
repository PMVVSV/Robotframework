*** Variables ***
${quote_request_main_content_locator}    xpath=//main[contains(@class,'request-for-quote')]
${quote_request_sidebar_locator}    xpath=//aside[@data-qa='component quote-request-sidebar']
${quote_request_back_to_list_button}    xpath=//aside[@data-qa='component quote-request-sidebar']//a[contains(.,'Back')]
${quote_request_cancel_button}    xpath=//aside[@data-qa='component quote-request-sidebar']//a[contains(@href,'cancel')]
${quote_request_revise_button}    xpath=//aside[@data-qa='component quote-request-sidebar']//a[contains(@href,'revise')]
${quote_request_convert_to_cart_button}    xpath=//aside[@data-qa='component quote-request-sidebar']//a[contains(@href,'convert')]
${quote_request_save_button}    name=save
${quote_request_send_to_customer_button}    name=sendToCustomer
${quote_request_edit_button}    xpath=//aside[@data-qa='component quote-request-sidebar']//a[contains(@href,'edit')]
${quote_request_edit_items_button}    xpath=//aside[@data-qa='component quote-request-sidebar']//a[contains(@href,'edit-items')]
${quote_request_save_and_back_to_edit_button}    name=saveAndBack
${quote_request_notes_text_area}    id=quote_request_form_latestVersion_metadata_note
${quote_request_send_to_agent_button}    name=sendToUser
${quote_request_convert_from_cart_confirm_button}    xpath=//button[contains(@class,'button')][contains(text(),'Submit')]