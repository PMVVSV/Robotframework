*** Settings ***
Library    SeleniumLibrary    plugins=SeleniumTestability;True;30 Seconds;True

*** Variables ***
${zed_confirm_delete_user_button}    xpath=//form[@name='delete_confirm_form']/input[@type='submit']