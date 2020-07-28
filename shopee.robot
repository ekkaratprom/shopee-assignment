*** Settings ***
Resource    keywords.robot
Test Setup    เปิด Shopee ด้วย Google Chrome
Test Teardown    ปิด Chrome

*** Test Cases ***
ซื้อเครื่องวัดความดัน Xiaomi ใน Shopee ผ่าน Chrome
    # ขยายหน้าจอ
    กดเลือกภาษาอังกฤษ
    กดซื้อเลย
    ลงชื่อผู้ใช้
    กด Enter
    หยุดรอพิมพ์ OTP
    กดตะกร้าสินค้า
    ตรวจสอบ ราคา รายละเอียดสินค้า
    กดปุ่ม สั่งสินค้า
    ตรวจสอบความถูกต้องของ ค่าใช้จ่ายทั้งหมด
    เลื่อนลงมาที่ปุ่มกดสั่งสินค้า    #กรณีบัคหน้าจอเล็ก(ที่ไม่ได้กดขยายจอ)แล้วมันหาปุ่มไม่เจอ เลยต้องเลื่อนลงมาให้เจอก่อน
    #กดเปลี่ยนการวิธีชำระเงิน     #กรณีเคยชำระเงินซื้อสินค้ามาก่อน
    คลิกเลือก iBanking / Mobile
    ตรวจสอบธนาคารว่าครบ 5 ธนาคาร
    คลิกเลือก ธนาคารกรุงไทย
    ตรวจสอบความถูกต้องครั้งสุดท้าย
    คลิกสั่งสินค้า ครั้งสุดท้าย

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
    Click Element    //*[@id="main"]/div/div[2]/div[2]/div[2]/div[2]/div[3]/div/div[5]/div/div/button[2]

ตรวจสอบ ราคา รายละเอียดสินค้า
    Wait Until Page Contains Element    class:cart-item-overview__name
    Element Should Contain    class:cart-item-overview__name    (Pre-Order) Xiaomi iHealth Blood Pressure Monitor 2 - เครื่องวัดความดัน รุ่น 2   
    Wait Until Page Contains Element    //*[@id="main"]//div[4]/div/span    
    Element Should Contain    //*[@id="main"]//div[4]/div/span    ฿11,160
    Wait Until Page Contains Element    //*[@id="main"]//div[5]/div[1]/input
    
    Wait Until Page Contains Element    class:cart-item__cell-total-price
    Element Should Contain     class:cart-item__cell-total-price    ฿11,160
    Wait Until Page Contains Element    class:cart-page-footer-summary__subtotal-amount
    Element Should Contain    class:cart-page-footer-summary__subtotal-amount    ฿11,160

กดปุ่ม สั่งสินค้า
    # Press Keys    //*[@id="main"]/div/div[2]/div[2]/div[3]/div[2]/div[7]/div[5]/button    RETURN
    # Click Element    xpath://*[@id="main"]/div/div[2]/div[2]/div[3]/div[2]/div[7]/div[5]/button
    
    Set Window Size    1920    800
    
    
    Click Element    //*[@id="main"]/div/div[2]/div[2]/div[3]/div[2]/div[7]/div[5]/button/span

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

ขยายหน้าจอ
    Set Window Size    1920    800

กดเปลี่ยนการวิธีชำระเงิน  
    Click Element    //div[@class="checkout-change-payment-method-button"]

คลิกเลือก iBanking / Mobile 
    # Wait Until Page Contains Element    //*[@id="main"]/div/div[2]/div[3]/div[4]/div[1]/div/div[1]/div[2]/span[3]/button    20s
    Click Element    //*[@id="main"]/div/div[2]/div[3]/div[4]/div[1]/div/div[1]/div[2]/span[3]/button
    # Click Button   button//*[@id="main"]/div/div[2]/div[3]/div[4]/div[1]/div/div[1]/div[2]/span[3]/button

ตรวจสอบธนาคารว่าครบ 5 ธนาคาร  
    Wait Until Page Contains Element    //img[@src="https://shopee.co.th/static/images/img_bankth_bbl.png"]     
    Wait Until Page Contains Element    //img[@src="https://shopee.co.th/static/images/img_bankth_ktb.png"]           
    Wait Until Page Contains Element    //img[@src="https://shopee.co.th/static/images/img_bankth_scb.png"]       
    Wait Until Page Contains Element    //img[@src="https://mall.shopee.co.th/static/images/img_bankth_kbank.png"]        
    Wait Until Page Contains Element    //img[@src="https://mall.shopee.co.th/static/images/img_bankth_bay.png"]          

คลิกเลือก ธนาคารกรุงไทย
    # Wait Until Page Contains Element    //img[@src="https://shopee.co.th/static/images/img_bankth_ktb.png"]
    Click Element    //img[@src="https://shopee.co.th/static/images/img_bankth_ktb.png"]  
    Press Keys    None    ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW 

ตรวจสอบความถูกต้องครั้งสุดท้าย
    Wait Until Page Contains Element    //div[@class="_38DBn- _2wZvga _2ZumAb"]    10s 
    Element Should Contain     //div[@class="_38DBn- _2wZvga _2ZumAb"]    ฿11,160

    Wait Until Page Contains Element    //*[@id="main"]/div/div[2]/div[3]/div[4]/div[2]/div[4]    10s
    Element Should Contain     //*[@id="main"]/div/div[2]/div[3]/div[4]/div[2]/div[4]    ฿50

    Wait Until Page Contains Element    //*[@id="main"]/div/div[2]/div[3]/div[4]/div[2]/div[6]    10s
    Element Should Contain     //*[@id="main"]/div/div[2]/div[3]/div[4]/div[2]/div[6]    ฿11,210


คลิกสั่งสินค้า ครั้งสุดท้าย
    Click Element    //*[@id="main"]/div/div[2]/div[3]/div[4]/div[2]/div[7]/button

ปิด Chrome
    Close Browser

