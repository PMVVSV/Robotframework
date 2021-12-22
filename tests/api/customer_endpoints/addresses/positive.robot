*** Settings ***
Suite Setup       SuiteSetup
Resource    ../../../../resources/common/common_api.robot

*** Test Cases ***
#####POST#####
Create_customer_address_with_all_fields
    When When I get access token for the customer:    ${yves_user_email}
    And I set Headers:    Content-Type=${default_header_content_type}    Authorization=${token}
    And I send a POST request:    /customers/${yves_user_reference}/addresses    {"data": {"type": "addresses","attributes": {"customer_reference": "${yves_user_reference}","salutation": "${yves_user_salutation}","firstName": "${yves_user_first_name}","lastName": "${yves_user_last_name}","address1": "${default_address1}","address2": "${default_address2}","address3": "${default_address3}","zipCode": "${default_zipCode}","city": "${default_city}","country": "${default_country}","iso2Code": "${default_iso2Code}","company":"${default_company}","phone": "${default_phone}","isDefaultShipping": False,"isDefaultBilling": False}}}
    Then Response status code should be:    201
    And Response reason should be:    Created
    And Response header parameter should be:    Content-Type    ${default_header_content_type}
    And Response body parameter should not be EMPTY:    [data][id]
    And Save value to a variable:    [data][id]    address_uid_1
    And Response body parameter should be:    [data][attributes][salutation]    ${yves_user_salutation}
    And Response body parameter should be:    [data][attributes][firstName]    ${yves_user_first_name}
    And Response body parameter should be:    [data][attributes][lastName]    ${yves_user_last_name}
    And Response body parameter should be:    [data][attributes][address1]    ${default_address1}
    And Response body parameter should be:    [data][attributes][address2]    ${default_address2}
    And Response body parameter should be:    [data][attributes][address3]    ${default_address3}
    And Response body parameter should be:    [data][attributes][zipCode]    ${default_zipCode}
    And Response body parameter should be:    [data][attributes][city]    ${default_city}
    And Response body parameter should be:    [data][attributes][country]    ${default_country}
    And Response body parameter should be:    [data][attributes][iso2Code]    ${default_iso2Code}
    And Response body parameter should be:    [data][attributes][company]    ${default_company}
    And Response body parameter should be:    [data][attributes][phone]    ${default_phone}
    And Response body parameter should be:    [data][attributes][isDefaultShipping]    True
    And Response body parameter should be:    [data][attributes][isDefaultBilling]    True
    Response body has correct self link for created entity:    ${address_uid_1}
    [Teardown]    I send a DELETE request:     /customers/${yves_user_reference}/addresses/${address_uid_1}

Create_customer_address_only_required_fields
    When When I get access token for the customer:    ${yves_user_email}
    And I set Headers:    Content-Type=${default_header_content_type}    Authorization=${token}
    And I send a POST request:    /customers/${yves_user_reference}/addresses    {"data": {"type": "addresses","attributes": {"salutation": "${yves_user_salutation}","firstName": "${yves_user_first_name}","lastName": "${yves_user_last_name}","address1": "${default_address1}","address2": "${default_address2}","zipCode": "${default_zipCode}","city": "${default_city}","iso2Code": "${default_iso2Code}","isDefaultShipping": False,"isDefaultBilling": False}}}
    Then Response status code should be:    201
    And Response reason should be:    Created
    And Response header parameter should be:    Content-Type    ${default_header_content_type}
    And Response body parameter should not be EMPTY:    [data][id]
    And Save value to a variable:    [data][id]    address_uid_1
    And Response body parameter should be:    [data][attributes][salutation]    ${yves_user_salutation}
    And Response body parameter should be:    [data][attributes][firstName]    ${yves_user_first_name}
    And Response body parameter should be:    [data][attributes][lastName]    ${yves_user_last_name}
    And Response body parameter should be:    [data][attributes][address1]    ${default_address1}
    And Response body parameter should be:    [data][attributes][address2]    ${default_address2}
    And Response body parameter should be:    [data][attributes][address3]    None
    And Response body parameter should be:    [data][attributes][zipCode]    ${default_zipCode}
    And Response body parameter should be:    [data][attributes][city]    ${default_city}
    And Response body parameter should be:    [data][attributes][country]    ${default_country}
    And Response body parameter should be:    [data][attributes][iso2Code]    ${default_iso2Code}
    And Response body parameter should be:    [data][attributes][company]    None
    And Response body parameter should be:    [data][attributes][phone]    None
    And Response body parameter should be:    [data][attributes][isDefaultShipping]    True
    And Response body parameter should be:    [data][attributes][isDefaultBilling]    True
    Response body has correct self link for created entity:    ${address_uid_1}
    [Teardown]    I send a DELETE request:     /customers/${yves_user_reference}/addresses/${address_uid_1}


Create_customer_address_as_shipping_default
    When When I get access token for the customer:    ${yves_user_email}
    And I set Headers:    Content-Type=${default_header_content_type}    Authorization=${token}
    And I send a POST request:    /customers/${yves_user_reference}/addresses    {"data": {"type": "addresses","attributes": {"salutation": "${yves_user_salutation}","firstName": "${yves_user_first_name}","lastName": "${yves_user_last_name}","address1": "${default_address1}","address2": "${default_address2}","zipCode": "${default_zipCode}","city": "${default_city}","iso2Code": "${default_iso2Code}","isDefaultShipping": False,"isDefaultBilling": False}}}
    Then Response status code should be:    201
    And Response reason should be:    Created
    And Response header parameter should be:    Content-Type    ${default_header_content_type}
    And Response body parameter should not be EMPTY:    [data][id]
    And Save value to a variable:    [data][id]    first_address_uid
    And Response body parameter should be:    [data][attributes][isDefaultShipping]    True
    And Response body parameter should be:    [data][attributes][isDefaultBilling]    True
    When I send a POST request:    /customers/${yves_user_reference}/addresses    {"data": {"type": "addresses","attributes": {"salutation": "${yves_user_salutation}","firstName": "${yves_user_first_name}","lastName": "${yves_user_last_name}","address1": "${default_address1}","address2": "${default_address2}","zipCode": "${default_zipCode}","city": "${default_city}","iso2Code": "${default_iso2Code}","isDefaultShipping": True,"isDefaultBilling": False}}}
    Then Response status code should be:    201
    And Response reason should be:    Created
    And Response header parameter should be:    Content-Type    ${default_header_content_type}
    And Response body parameter should not be EMPTY:    [data][id]
    And Save value to a variable:    [data][id]    shipping_address_uid
    And Response body parameter should be:    [data][attributes][isDefaultShipping]    True
    And Response body parameter should be:    [data][attributes][isDefaultBilling]    False
    When When I send a GET request:    /customers/${yves_user_reference}/addresses/${first_address_uid}
    Then Response status code should be:    200
    And Response reason should be:    OK
    And Response body parameter should be:    [data][attributes][isDefaultShipping]    False
    And Response body parameter should be:    [data][attributes][isDefaultBilling]    True
    [Teardown]    Run Keywords    I send a DELETE request:     /customers/${yves_user_reference}/addresses/${first_address_uid}    
    ...    AND    I send a DELETE request:     /customers/${yves_user_reference}/addresses/${shipping_address_uid}

Create_customer_address_as_billing_default
    When When I get access token for the customer:    ${yves_user_email}
    And I set Headers:    Content-Type=${default_header_content_type}    Authorization=${token}
    And I send a POST request:    /customers/${yves_user_reference}/addresses    {"data": {"type": "addresses","attributes": {"salutation": "${yves_user_salutation}","firstName": "${yves_user_first_name}","lastName": "${yves_user_last_name}","address1": "${default_address1}","address2": "${default_address2}","zipCode": "${default_zipCode}","city": "${default_city}","iso2Code": "${default_iso2Code}","isDefaultShipping": False,"isDefaultBilling": False}}}
    Then Response status code should be:    201
    And Response reason should be:    Created
    And Response header parameter should be:    Content-Type    ${default_header_content_type}
    And Response body parameter should not be EMPTY:    [data][id]
    And Save value to a variable:    [data][id]    first_address_uid
    And Response body parameter should be:    [data][attributes][isDefaultShipping]    True
    And Response body parameter should be:    [data][attributes][isDefaultBilling]    True
    When I send a POST request:    /customers/${yves_user_reference}/addresses    {"data": {"type": "addresses","attributes": {"salutation": "${yves_user_salutation}","firstName": "${yves_user_first_name}","lastName": "${yves_user_last_name}","address1": "${default_address1}","address2": "${default_address2}","zipCode": "${default_zipCode}","city": "${default_city}","iso2Code": "${default_iso2Code}","isDefaultShipping": False,"isDefaultBilling": True}}}
    Then Response status code should be:    201
    And Response reason should be:    Created
    And Response header parameter should be:    Content-Type    ${default_header_content_type}
    And Response body parameter should not be EMPTY:    [data][id]
    And Save value to a variable:    [data][id]    shipping_address_uid
    And Response body parameter should be:    [data][attributes][isDefaultShipping]    False
    And Response body parameter should be:    [data][attributes][isDefaultBilling]    True
    When When I send a GET request:    /customers/${yves_user_reference}/addresses/${first_address_uid}
    Then Response status code should be:    200
    And Response reason should be:    OK
    And Response body parameter should be:    [data][attributes][isDefaultShipping]    True
    And Response body parameter should be:    [data][attributes][isDefaultBilling]    False
    [Teardown]    Run Keywords    I send a DELETE request:     /customers/${yves_user_reference}/addresses/${first_address_uid}    
    ...    AND    I send a DELETE request:     /customers/${yves_user_reference}/addresses/${shipping_address_uid}

#GET
#Get_empty_list_of_customer_addresses

#Get_non_empty_list_of_customer_addresses

#DELETE
#Delete_customer_address

#PATCH
#Update_customer_address

