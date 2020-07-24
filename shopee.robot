*** Settings ***
Library    SeleniumLibrary
Test Setup    เปิด Shopee ด้วย Google Chrome
# Test Teardown    ปิด Google Chrome

*** Variables ***
${URL}    https://shopee.co.th/(Pre-Order)-Xiaomi-iHealth-Blood-Pressure-Monitor-2-%E0%B9%80%E0%B8%84%E0%B8%A3%E0%B8%B7%E0%B9%88%E0%B8%AD%E0%B8%87%E0%B8%A7%E0%B8%B1%E0%B8%94%E0%B8%84%E0%B8%A7%E0%B8%B2%E0%B8%A1%E0%B8%94%E0%B8%B1%E0%B8%99-%E0%B8%A3%E0%B8%B8%E0%B9%88%E0%B8%99-2-i.8172430.1307643368
${EMAIL}    test.test@outlook.co.th
${PASSWORD}    AllianzG4
${TIME}    15s

*** Keywords ***
เปิด Shopee ด้วย Google Chrome
    Open Browser    ${URL}    chrome
กดเลือกภาษาอังกฤษ
    Click Element    //button[@class="shopee-button-outline shopee-button-outline--primary-reverse "]
กดซื้อเลย
    Click Element    //button[@class="btn btn-solid-primary btn--l YtgjXY"]
พิมพ์อีเมล์
    Input Text    //input[@placeholder="หมายเลขโทรศัพท์ / Email / ชื่อผู้ใช้"]    ${EMAIL}
พิมพ์พาสเวิร์ด
    Input Text    //input[@placeholder="รหัสผ่าน"]    ${PASSWORD}
กด Enter
    Press Keys    //input[@placeholder="รหัสผ่าน"]    RETURN
หยุดรอพิมพ์ OTP
    Sleep    ${TIME}
กดตะกร้าสินค้า
    Click Element    //div[@class="stardust-popover"]
ปิด Google Chrome
    Close Browser
ซื้อสินค้าบน Shopee ผ่าน Chrome
    กดเลือกภาษาอังกฤษ
    กดซื้อเลย
    พิมพ์อีเมล์
    พิมพ์พาสเวิร์ด
    กด Enter
    หยุดรอพิมพ์ OTP
    กดตะกร้าสินค้า
*** Test Cases ***
ซื้อเครื่องวัดความดันบน Shopee
    ซื้อสินค้าบน Shopee ผ่าน Chrome