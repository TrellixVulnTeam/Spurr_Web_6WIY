*** Variables ***
${url_CreateLoyalty}                https://app-dev-v2.gospurr.com/loyalty-type
${btn_CreateLoyalty}                xpath://a[contains(text(),'CREATE LOYALTY PROGRAM')]
${rdioBtn_SpendBased}               xpath://span[contains(text(),'SPEND-BASED')]
${rdioBtn_SpendMeter}               xpath://span[contains(text(),'SPEND METER')]
${rdioBtn_ItemBased}                xpath://span[contains(text(),'ITEM-BASED')]
${rdioBtn_VisitBased}               xpath://span[contains(text(),'VISIT-BASED')]

#Visit Based
${btn_Req_SpendBased}               xpath://body[1]/ul[1]/li[2]/section[3]/ul[1]/li[1]/ul[1]/li[3]/div[1]/ul[1]/li[1]/a[1]/span[1]/strong[1]
${btn_Req_SpendBasedOff}            xpath://body/ul[1]/li[2]/section[3]/ul[1]/li[1]/ul[1]/li[3]/div[1]/ul[1]/li[1]/a[1]
${btn_Req_SpendBasedOn}             xpath://body/ul[1]/li[2]/section[3]/ul[1]/li[1]/ul[1]/li[1]/div[1]/ul[1]/li[1]/a[1]/span[1]/em[1]

${field_Ttl_Stamp}                  xpath://body[1]/ul[1]/li[2]/section[3]/ul[1]/li[1]/ul[1]/li[4]/div[1]/ul[2]/li[1]/input[1]
${field_SpndStamp_idr}              xpath://body[1]/ul[1]/li[2]/section[3]/ul[1]/li[1]/ul[1]/li[4]/div[1]/ul[2]/li[2]/input[1]
${lylty_StrtDate}                   xpath://body[1]/ul[1]/li[2]/section[3]/ul[1]/li[1]/ul[1]/li[4]/div[1]/ul[2]/li[3]/input[1]
${lylty_EndDate}                    xpath://body[1]/ul[1]/li[2]/section[3]/ul[1]/li[1]/ul[1]/li[4]/div[1]/ul[2]/li[4]/input[1]
${btn_next}                         xpath://body/ul[1]/li[2]/section[4]/ul[1]/li[2]/a[1]

${Ttl_Stamp}                        5
${idr}                              10000

#Step 2 => Free Gift
${step_Vrfy_Step2}                  xpath://li[@class='active']//span[contains(text(),'2')]
${drpdwn_RewardType}                xpath://body[1]/ul[1]/li[2]/section[3]/ul[1]/li[1]/ul[1]/li[1]/div[1]/ul[1]/li[1]/ul[1]/li[1]/span[1]/span[1]/span[1]/span[1]
${slct_FreeGift}                    xpath://body[1]/span[1]/span[1]/span[2]/ul[1]/li[3]
${field_RewardValue}                id:reward_value
${field_RewardName}                 id:reward_name
${field_RewardStamp}                id:reward_stamps
${btn_UploadImage}                  xpath://*[@class='input-logo']
${btn_Crop}                         id:submit_crop
${btn_next_reward}                  xpath://body[1]/ul[1]/li[2]/section[4]/ul[1]/li[2]/a[1]

${rewardValue}                      500000
${rewardName}                       Auto_1StampPerTransaction
${rewardStamp}                      5
${imageFile}                        /Users/machruk/Documents/Gift.png

#Step 2 => Cash Voucher
${slct_CashVoucher}                 xpath://body[1]/span[1]/span[1]/span[2]/ul[1]/li[2]
${btn_AddReward}                    xpath://a[@class='btn btn-green with-prior'][contains(text(),'ADD REWARD')]


#Step 3
${chckBox_TermCond1}                xpath://body/ul[1]/li[2]/section[3]/ul[1]/li[1]/ul[1]/li[1]/div[2]/ul[1]/li[1]/a[@class='is-on']
${chckBox_TermCond2}                xpath://body[1]/ul[1]/li[2]/section[3]/ul[1]/li[1]/ul[1]/li[1]/div[2]/ul[1]/li[2]/a[1]/span[1]
${field_AddTerm}                    xpath://body/ul[1]/li[2]/section[3]/ul[1]/li[1]/ul[1]/li[1]/div[2]/ul[2]/li[1]/textarea[1]
${btn_Publish}                      xpath://body/ul[1]/li[2]/section[4]/ul[1]/li[2]/a[1]
${ver_Suc_Publ}                     xpath://span[contains(text(),'Congratulations!')]
${btn_Close_Publ}                   xpath://button[contains(text(),'Close')]


*** Keywords ***
Go to Loyalty Page
    Go to                               ${url_CreateLoyalty}

Select 1 Stamp per Transaction
    Wait Until Element is Enabled       ${rdioBtn_VisitBased}                   ${delay}
    scroll element into view            ${rdioBtn_VisitBased}
    Page Should Contain Element         ${rdioBtn_VisitBased}
    Click Element                       ${rdioBtn_VisitBased}

Input Total Number Stamp
    Wait Until Element is Enabled       ${field_Ttl_Stamp}                      ${delay}
    Input Text                          ${field_Ttl_Stamp}                      ${Ttl_Stamp}
Input Minimum Spend
    Wait Until Element is Enabled       ${field_SpndStamp_idr}                  ${delay}
    Input Text                          ${field_SpndStamp_idr}                  ${idr}
Select Loyalty Period
    Sleep                               3
    ${slct_StrtDate}=                   Get Current Date
    ${startDate}=                       Convert Date                            ${slct_StrtDate}                result_format=%d %B %Y
    Press Keys                          ${lylty_StrtDate}                       ${startDate}
    Sleep                               3
    ${slct_EndDate}=                    Add Time To Date                        ${slct_StrtDate}                7 Days
    ${EndDate}=                         Convert Date                            ${slct_EndDate}                 result_format=%d %B %Y
    Press Keys                          ${lylty_EndDate}                        ${EndDate}
Click Next Button
    Wait Until Element is Enabled       ${btn_next}                             ${delay}
    Click Element                       ${btn_next}
Verify Reward Details are Displayed Properly
    Wait Until Element is Enabled       ${step_Vrfy_Step2}                      ${delay}
    Page Should Contain Element         ${step_Vrfy_Step2}
    Page Should Contain Element         ${drpdwn_RewardType}
    Page Should Contain Element         ${field_RewardValue}
    Page Should Contain Element         ${field_RewardName}
    Page Should Contain Element         ${btn_UploadImage}
    Page Should Contain Element         ${btn_AddReward}

#Select Free Gift
Select Free Gift Type
    Wait Until Element is Enabled       ${drpdwn_RewardType}                    ${delay}
    Click Element                       ${drpdwn_RewardType}
    Wait Until Element is Enabled       ${slct_FreeGift}                        ${delay}
    Click Element                       ${slct_FreeGift}
Input Reward Value
    Wait Until Element is Enabled       ${field_RewardValue}                    ${delay}
    Input Text                          ${field_RewardValue}                    ${rewardValue}
Input Reward Name
    ${random}=                          Generate Random String                  3       [NUMBERS]
    Wait Until Element is Enabled       ${field_RewardName}                     ${delay}
    Input Text                          ${field_RewardName}                     FreeGift_Espresso${random}
Upload Image
    Wait Until Element is Enabled       ${btn_UploadImage}                      ${delay}
    Choose File                         ${btn_UploadImage}                      ${imageFile}
    sleep                               3
    Wait Until Element is Enabled       ${btn_Crop}                             ${delay}
    #Click Element                       ${btn_Crop}
Click Next button (reward)
    Wait Until Element is Enabled       ${btn_next_reward}                      ${delay}
    Click Element                       ${btn_next_reward}


#Step 2 => Select Cash Voucher
Select Cash Voucher Period
    Sleep                               3
    ${slct_CurDate}=                    Get Current Date
    ${slct_StrtDate}                    Add Time To Date                        ${slct_CurDate}                 10 Days
    ${startDate}=                       Convert Date                            ${slct_StrtDate}                result_format=%d %B %Y
    Press Keys                          ${field_StrtDate}                       ${startDate}
    Sleep                               3
    ${slct_EndDate}=                    Add Time To Date                        ${slct_StrtDate}                7 Days
    ${EndDate}=                         Convert Date                            ${slct_EndDate}                 result_format=%d %B %Y
    Press Keys                          ${field_EndDate}                        ${EndDate}
Select Cash Voucher Type
    Wait Until Element is Enabled       ${drpdwn_RewardType}                    ${delay}
    Click Element                       ${drpdwn_RewardType}
    Wait Until Element is Enabled       ${slct_CashVoucher}                     ${delay}
    Click Element                       ${slct_CashVoucher}


#Step 3
Verify Term & Condition Checkbox are selected
    Wait Until Element is Enabled       ${chckBox_TermCond1}                    ${delay}
    Page Should Contain Element         ${chckBox_TermCond1}
    Page Should Contain Element         ${chckBox_TermCond2}
Add Term of Service
    Wait Until Element is Enabled       ${field_AddTerm}                        ${delay}
    Input Text                          ${field_AddTerm}                        Add Term Testing
Click Publish button
    Wait Until Element is Enabled       ${btn_Publish}                          ${delay}
    Click Element                       ${btn_Publish}
Verify Publish Reward is Successfully
    Wait Until Element is Enabled       ${ver_Suc_Publ}                         ${delay}
    Page Should Contain Element         ${ver_Suc_Publ}
    Sleep                               15
    Wait Until Element is Visible       ${btn_Close_Publ}
    Click Element                       ${btn_Close_Publ}

#Add Reward
Click Add Reward button
    Wait Until Element is Enabled       ${btn_AddReward}                        ${delay}
    Click Element                       ${btn_AddReward}
Select Free Gift Type (2)
    Wait Until Element is Enabled       ${drpdwn_RewardType}                    ${delay}
    Click Element                       ${drpdwn_RewardType}
    Wait Until Element is Enabled       ${slct_FreeGift}                        ${delay}
    Click Element                       ${slct_FreeGift}
Input Reward Value (2)
    Wait Until Element is Enabled       ${field_RewardValue}                    ${delay}
    Input Text                          ${field_RewardValue}                    ${rewardValue}
Input Reward Name (2)
    ${random}=                          Generate Random String                  3       [NUMBERS]
    Wait Until Element is Enabled       ${field_RewardName}                     ${delay}
    Input Text                          ${field_RewardName}                     FreeGift_Espresso${random}
Upload Image (2)
    Wait Until Element is Enabled       ${btn_UploadImage}                      ${delay}
    Choose File                         ${btn_UploadImage}                      ${imageFile}
    sleep                               3
    Wait Until Element is Enabled       ${btn_Crop}                             ${delay}
    #Click Element                       ${btn_Crop}

