*** Settings ***
Library    SeleniumLibrary
Test Setup    เปิด Shopee ด้วย Google Chrome
# Test Teardown    ปิด Chrome

*** Variables ***
${URL}    https://shopee.co.th/(Pre-Order)-Xiaomi-iHealth-Blood-Pressure-Monitor-2-%E0%B9%80%E0%B8%84%E0%B8%A3%E0%B8%B7%E0%B9%88%E0%B8%AD%E0%B8%87%E0%B8%A7%E0%B8%B1%E0%B8%94%E0%B8%84%E0%B8%A7%E0%B8%B2%E0%B8%A1%E0%B8%94%E0%B8%B1%E0%B8%99-%E0%B8%A3%E0%B8%B8%E0%B9%88%E0%B8%99-2-i.8172430.1307643368
# ${URL}    https://shopee.co.th/shopping_cart/?itemIds=1307643368&shopId=8172430
${EMAIL}    test.test@outlook.co.th
${PASSWORD}    AllianzG4
${TIME}      90s
${PRICE}    ฿11,160
${PRODUCT_AMOUNT}    1
${LOGISTIC_PRICE}    ฿50
${TOTAL_PRICE}    ฿11,210


*** Test Cases ***
ซื้อสินค้าบน Shopee ผ่าน Chrome
    กดเลือกภาษาอังกฤษ
    กดซื้อเลย
    ลงชื่อผู้ใช้
    กด Enter
    หยุดรอพิมพ์ OTP
    กดตะกร้าสินค้า
    ตรวจสอบ ราคา รายละเอียดสินค้า
    กดปุ่ม สั่งสินค้า
    ตรวจสอบความถูกต้องของ ค่าใช้จ่ายทั้งหมด
    #เลื่อนลงมาที่ปุ่มกดสั่งสินค้า    #กรณีบัคหน้าจอเล็ก(ที่ไม่ได้กดขยายจอ)แล้วมันหาปุ่มไม่เจอ เลยต้องเลื่อนลงมาให้เจอก่อน

*** Keywords ***

เปิด Shopee ด้วย Google Chrome
    Open Browser    ${URL}    chrome

กดเลือกภาษาอังกฤษ
    Wait Until Page Contains Element    //button[@class="shopee-button-outline shopee-button-outline--primary-reverse "]
    Click Element    //button[@class="shopee-button-outline shopee-button-outline--primary-reverse "]

กดซื้อเลย
    Wait Until Page Contains Element    //button[@class="btn btn-solid-primary btn--l YtgjXY"]
    Click Element    //button[@class="btn btn-solid-primary btn--l YtgjXY"]

ลงชื่อผู้ใช้
    Wait Until Page Contains Element    //input[@placeholder="หมายเลขโทรศัพท์ / Email / ชื่อผู้ใช้"]
    Input Text    //input[@placeholder="หมายเลขโทรศัพท์ / Email / ชื่อผู้ใช้"]    ${EMAIL}
    Input Text    //input[@placeholder="รหัสผ่าน"]    ${PASSWORD}

กด Enter
    Press Keys    //input[@placeholder="รหัสผ่าน"]    RETURN

หยุดรอพิมพ์ OTP
    Sleep    ${TIME}

กดตะกร้าสินค้า
    Click Element    //div[@class="cart-drawer-container"]

ตรวจสอบ ราคา รายละเอียดสินค้า
    Wait Until Page Contains Element    class:cart-item-overview__name
    Element Should Contain    class:cart-item-overview__name    (Pre-Order) Xiaomi iHealth Blood Pressure Monitor 2 - เครื่องวัดความดัน รุ่น 2   
    Wait Until Page Contains Element    //*[@id="main"]//div[4]/div/span    
    Element Should Contain    //*[@id="main"]//div[4]/div/span    ฿11,160
    Wait Until Page Contains Element    //*[@id="main"]//div[5]/div[1]/input
    
    Wait Until Page Contains Element    class:cart-item__cell-total-price
    Element Should Contain     class:cart-item__cell-total-price    ฿11,160
    Wait Until Page Contains Element    //*[@id="main"]/div/div[2]/div[2]/div[3]/div[2]/div[7]/div[4]/div[1]/div/div[2]
    Element Should Contain     //*[@id="main"]/div/div[2]/div[2]/div[3]/div[2]/div[7]/div[4]/div[1]/div/div[2]    ฿11,160

กดปุ่ม สั่งสินค้า
    Press Keys    //*[@id="main"]/div/div[2]/div[2]/div[3]/div[2]/div[7]/div[5]/button    RETURN

ตรวจสอบความถูกต้องของ ราคาสินค้าชนิดนี้
    Sleep    2s
    Press Keys    None    ARROW_RIGHT+ARROW_DOWN+ARROW_RIGHT+ARROW_DOWN+ARROW_RIGHT+ARROW_DOWN+ARROW_RIGHT+ARROW_DOWN    #ในกรณีจอเล็กที่ไม่ด้กดขยายจอ มันจะหาไม่เจอ เลยต้องเลื่อนให้มาเจอก่อน
    Wait Until Element Contains    //*[@id="main"]/div/div[2]/div[3]/div[2]/div[2]/div/div[1]/div/div[2]/div/div[5]    ${PRICE}    10s

ตรวจสอบความถูกต้องของ ค่าจัดส่ง
    Wait Until Element Contains    //div[@class="_1NQqVn"]    ${LOGISTIC_PRICE}    5s

ตรวจสอบความถูกต้องของ ราคาของรวมค่าส่ง
    Wait Until Element Contains    //div[@class="_7IQQY9"]    ${TOTAL_PRICE}    5s

เลื่อนลงมาที่ปุ่มกดสั่งสินค้า
    Press Keys    None    ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN

#รวมคำสั่ง
ตรวจสอบความถูกต้องของ ค่าใช้จ่ายทั้งหมด
    ตรวจสอบความถูกต้องของ ราคาสินค้าชนิดนี้
    ตรวจสอบความถูกต้องของ ค่าจัดส่ง
    ตรวจสอบความถูกต้องของ ราคาของรวมค่าส่ง

# ปิด Chrome
#     Close Browser
