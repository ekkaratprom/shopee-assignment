*** Settings ***
Library    SeleniumLibrary
Test Setup    เปิด Shopee ด้วย Google Chrome
# Test Teardown    ปิด Google Chrome 

*** Test Cases ***                                   
ซื้อสินค้าบน Shopee ผ่าน Chrome
    กดเลือกภาษาอังกฤษ
    กดซื้อเลย
    พิมพ์อีเมล์
    พิมพ์พาสเวิร์ด
    กด Enter
    หยุดรอพิมพ์ OTP
    กดตะกร้าสินค้า
// Waiting for top
    คลิกเลือก iBanking / Mobile 
    ตรวจสอบธนาคารว่าครบ 5 ธนาคาร
    คลิกเลือก ธนาคารกรุงไทย
    ตรวจสอบการชำระเงินทั้งหมด
    คลิกสั่งสินค้า 

*** Variables ***
${URL}    https://shopee.co.th/(Pre-Order)-Xiaomi-iHealth-Blood-Pressure-Monitor-2-%E0%B9%80%E0%B8%84%E0%B8%A3%E0%B8%B7%E0%B9%88%E0%B8%AD%E0%B8%87%E0%B8%A7%E0%B8%B1%E0%B8%94%E0%B8%84%E0%B8%A7%E0%B8%B2%E0%B8%A1%E0%B8%94%E0%B8%B1%E0%B8%99-%E0%B8%A3%E0%B8%B8%E0%B9%88%E0%B8%99-2-i.8172430.1307643368
${EMAIL}    test.test@outlook.co.th
${PASSWORD}    AllianzG4
${TIME}    90s

*** Keywords ***
เปิด Shopee ด้วย Google Chrome
    Open Browser    ${URL}    chrome
กดเลือกภาษาอังกฤษ
    Wait Until Page Contains Element    //button[@class="shopee-button-outline shopee-button-outline--primary-reverse "]
    Click Element    //button[@class="shopee-button-outline shopee-button-outline--primary-reverse "]
กดซื้อเลย
    Wait Until Page Contains Element    //button[@class="btn btn-solid-primary btn--l YtgjXY"]
    Click Element    //button[@class="btn btn-solid-primary btn--l YtgjXY"]
พิมพ์อีเมล์
    Wait Until Page Contains Element    //input[@placeholder="หมายเลขโทรศัพท์ / Email / ชื่อผู้ใช้"]
    Input Text    //input[@placeholder="หมายเลขโทรศัพท์ / Email / ชื่อผู้ใช้"]    ${EMAIL}
พิมพ์พาสเวิร์ด
    Input Text    //input[@placeholder="รหัสผ่าน"]    ${PASSWORD}
กด Enter
    Press Keys    //input[@placeholder="รหัสผ่าน"]    RETURN
หยุดรอพิมพ์ OTP
    Sleep    ${TIME}
กดตะกร้าสินค้า
    Click Element    //div[@class="stardust-popover"]

//
//
// Waiting for top
//
//
//

คลิกเลือก iBanking / Mobile 
    Wait Until Page Contains Element    //button[@class="product-variation product-variation--selected"]
    Click Link    //button[@class="product-variation product-variation--selected"]

ตรวจสอบธนาคารว่าครบ 5 ธนาคาร  
    # ธนาคารกรุงเทพ         
    Wait Until Page Contains Element    //*[@id="main"]/div/div[2]/div[3]/div[4]/div[1]/div/div[2]/div[1]/div[2]/div[1]/div/div[2]/div/div/div[1]/img
    # ธนาคารกรุงไทย          
    Wait Until Page Contains Element    //*[@id="main"]/div/div[2]/div[3]/div[4]/div[1]/div/div[2]/div[1]/div[2]/div[2]/div/div[2]/div/div/div[1]/img
    # ธนาคารไทยพาณิชย์       
    Wait Until Page Contains Element    //*[@id="main"]/div/div[2]/div[3]/div[4]/div[1]/div/div[2]/div[1]/div[2]/div[3]/div/div[2]/div/div/div[1]/img   
    # ธนาคารกสิกรไทย        
    Wait Until Page Contains Element    //*[@id="main"]/div/div[2]/div[3]/div[4]/div[1]/div/div[2]/div[2]/div[2]/div/div/div[2]/div/div/div[1]/img
    # ธนาคารกรุงศรี        
    Wait Until Page Contains Element    //*[@id="main"]/div/div[2]/div[3]/div[4]/div[1]/div/div[2]/div[3]/div[2]/div/div/div[2]/div/div/div[1]/img

คลิกเลือก ธนาคารกรุงไทย
    Wait Until Page Contains Element    //*[@id="main"]/div/div[2]/div[3]/div[4]/div[1]/div/div[2]/div[1]/div[2]/div[2]/div/div[2]/div/div/div[1]/img
    Click Link                          //*[@id="main"]/div/div[2]/div[3]/div[4]/div[1]/div/div[2]/div[1]/div[2]/div[2]/div/div[2]/div/div/div[1]/img

ตรวจสอบการชำระเงินทั้งหมด
   

คลิกสั่งสินค้า
    Wait Until Page Contains Element    //button[@class="stardust-button stardust-button--primary stardust-button--large _22Ktrb"]
    Click Element    //button[@class="stardust-button stardust-button--primary stardust-button--large _22Ktrb"]

ปิดหน้าเว็บ
    Close Browser


