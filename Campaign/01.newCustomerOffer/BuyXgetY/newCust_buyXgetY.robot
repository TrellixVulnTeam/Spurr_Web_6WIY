*** Settings ***
Documentation       Verify create New Customer Offer is successfully
Library             Selenium2Library
Library             DateTime
Library             String
Resource            ../../../Resources/res_Signup.robot
Resource            ../../../Resources/res_camp_newCustomer.robot
Resource            ../../../Resources/res_dbShopick.robot
Suite Setup         Connect To Database     pymysql  ${DBName}   ${DBUser}   ${DBPass}   ${DBHost}   ${DBPort}
#Suite Teardown      Close Browser




*** Test Cases ***
Delete Existing Campaign
    Delete New Customer Campaign

Verify create New Customer Offer (Buy X Get Y) is successfully
    New Customer => Buy X Get Y => Step 1
    New Customer => Buy X Get Y => Step 2
    New Customer => Buy X Get Y => Step 3

Verify edit New Customer Offer (Buy X Get Y) is successfully
    Edit Buy X Get Y Campaign




*** Keywords ***
###Buy X Get Y###
New Customer => Buy X Get Y => Step 1
    Go to Campaign menu
    Click Create Campaign
    Select New Customer Offer
    Click Next button
New Customer => Buy X Get Y => Step 2
    Input New Customer Name
    Select Buy X Get Y Type
    Input X Product
    Input Y Product
    Input X Product Value
    Input Y Product Value
    Input Minimum Spending
    Select Offer Period
    #Click Upload Image
    #Click Next button
New Customer => Buy X Get Y => Step 3
    #Click T&C 1 Radio Button
    #Click T&C 2 Radio Button
    Add T&C
    Click Publish
    Success Message is displayed

###Edit Buy X Get Y###
Edit Buy X Get Y Campaign
    Go to Campaign menu
    Click Edit Campaign
    Add Term & Condition
    Edit New Customer Offer Name
    Edit X Product
    Edit Y Product
    Edit X Product Value
    Edit Y Product Value
    Edit Minimum Spend
    Click Save Edit
    Success Edit Message is displayed