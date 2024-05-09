*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Test1
    Log    Hello Robot FrameWork
    Sleep    3
    Should Be Equal    1    1

SearchOnWeb_Chrome
    [Documentation]    Chrome浏览器测试用例
    Log    设置UTF-8编码
    Log    打开Chrome浏览器，输入URL
    Open Browser    https://www.sogou.com    Chrome    options=add_argument("--disable-blink-features=AutomationControlled");add_experimental_option("detach", True);add_experimental_option('excludeSwitches', ['enable-automation'])
    Maximize Browser Window
    Sleep    3
    Title should be    搜狗搜索引擎 - 上网从搜狗开始
    Sleep    3
    ${title}    Get Title
    Should be equal as Strings    ${title}    搜狗搜索引擎 - 上网从搜狗开始
    Log    在输入框输入内容
    Input Text    //input[@id="query" and @name="query" and @class="sec-input active"]    Hello Selenium
    Sleep    3
    Log    点击搜索按钮进行内容搜索
    Click Element    //input[@id="stb" and @type="submit" and @value="搜狗搜索"]
    Sleep    3
    Page Should contain    Hello Selenium - 搜狗搜索
    Sleep    3
    ${myPageSource}    Get Source
    Should Contain    ${myPageSource}    Hello Selenium - 搜狗搜索
    close browser
    [Teardown]    close browser

SearchOnWeb_IE
    [Documentation]    IE浏览器测试用例
    Log    设置UTF-8编码
    Log    打开IE浏览器，输入URL
    Open Browser    https://www.sogou.com    IE
    Maximize Browser Window
    Sleep    3
    Title should be    搜狗搜索引擎 - 上网从搜狗开始
    Sleep    3
    ${title}    Get Title
    Should be equal as Strings    ${title}    搜狗搜索引擎 - 上网从搜狗开始
    Log    在输入框输入内容
    Input Text    //input[@id="query" and @name="query" and @class="sec-input active"]    Hello Selenium
    Sleep    3
    Log    点击搜索按钮进行内容搜索
    Click Element    //input[@id="stb" and @type="submit" and @value="搜狗搜索"]
    Sleep    3
    Page Should contain    Hello Selenium - 搜狗搜索
    Sleep    3
    ${myPageSource}    Get Source
    Should Contain    ${myPageSource}    Hello Selenium - 搜狗搜索
    close browser
    [Teardown]    close browser

SearchOnWeb_Firefox
    [Documentation]    Firefox浏览器测试用例
    Log    设置UTF-8编码
    Log    打开Firefox浏览器，输入URL
    Open Browser    https://www.sogou.com    Firefox
    Maximize Browser Window
    Sleep    3
    Title should be    搜狗搜索引擎 - 上网从搜狗开始
    Sleep    3
    ${title}    Get Title
    Should be equal as Strings    ${title}    搜狗搜索引擎 - 上网从搜狗开始
    Log    在输入框输入内容
    Input Text    //input[@id="query" and @name="query" and @class="sec-input active"]    Hello Selenium
    Sleep    3
    Log    点击搜索按钮进行内容搜索
    Click Element    //input[@id="stb" and @type="submit" and @value="搜狗搜索"]
    Sleep    3
    Page Should contain    Hello Selenium - 搜狗搜索
    Sleep    3
    ${myPageSource}    Get Source
    Should Contain    ${myPageSource}    Hello Selenium - 搜狗搜索
    close browser
    [Teardown]    close browser

SearchOnWeb_Edge
    [Documentation]    Edge浏览器测试用例
    Log    设置UTF-8编码
    Log    打开Edge浏览器，输入URL
    Open Browser    https://www.sogou.com    Edge
    Maximize Browser Window
    Sleep    3
    Title should be    搜狗搜索引擎 - 上网从搜狗开始
    Sleep    3
    ${title}    Get Title
    Should be equal as Strings    ${title}    搜狗搜索引擎 - 上网从搜狗开始
    Log    在输入框输入内容
    Input Text    //input[@id="query" and @name="query" and @class="sec-input active"]    Hello Selenium
    Sleep    3
    Log    点击搜索按钮进行内容搜索
    Click Element    //input[@id="stb" and @type="submit" and @value="搜狗搜索"]
    Sleep    3
    Page Should contain    Hello Selenium - 搜狗搜索
    Sleep    3
    ${myPageSource}    Get Source
    Should Contain    ${myPageSource}    Hello Selenium - 搜狗搜索
    close browser
    [Teardown]    close browser

SearchOnWebWithList_Chrome
    [Documentation]    Chrome浏览器测试用例_下拉列表选择测试
    Log    设置UTF-8编码
    Log    打开Chrome浏览器，输入URL
    Open Browser    https://www.sogou.com    Chrome    options=add_argument("--disable-blink-features=AutomationControlled");add_experimental_option("detach", True);add_experimental_option('excludeSwitches', ['enable-automation'])
    Maximize Browser Window
    Sleep    3
    Title should be    搜狗搜索引擎 - 上网从搜狗开始
    Sleep    3
    ${title}    Get Title
    Log to console    ${title}
    Should be equal as Strings    ${title}    搜狗搜索引擎 - 上网从搜狗开始
    Log    在输入框输入内容
    ${content}    Set Variable    法拉利
    Log to console    ${content}
    Input Text    //input[@id="query" and @name="query" and @class="sec-input active"]    ${SPACE * 3}    空格键*3
    Sleep    3
    Input Text    //input[@id="query" and @name="query" and @class="sec-input active"]    ${EMPTY * 3}    空值*3
    Sleep    3
    Input Text    //input[@id="query" and @name="query" and @class="sec-input active"]    ${content}
    Sleep    5
    Log    根据下拉列表弹出的内容选择指定条目
    ${content2}    Get Text    //ul[starts-with(@class,'sugli')]//li[3]
    Log to console    ${content2}
    Click Element    //ul[starts-with(@class,'sugli')]//li[3]
    Sleep    3
    Page Should contain    ${content2} - 搜狗搜索
    Sleep    3
    ${myPageSource}    Get Source
    Should Contain    ${myPageSource}    ${content2} - 搜狗搜索
    Sleep    3
    Log to console    ${content2} - 搜狗搜索
    close browser
    [Teardown]    close browser

SearchOnWebWithList_IE
    [Documentation]    IE浏览器测试用例_下拉列表选择测试
    Log    设置UTF-8编码
    Log    打开IE浏览器，输入URL
    Open Browser    https://www.sogou.com    ie
    Maximize Browser Window
    Sleep    3
    Title should be    搜狗搜索引擎 - 上网从搜狗开始
    Sleep    3
    ${title}    Get Title
    Log to console    ${title}
    Should be equal as Strings    ${title}    搜狗搜索引擎 - 上网从搜狗开始
    Log    在输入框输入内容
    ${content}    Set Variable    奔驰
    Log to console    ${content}
    Input Text    //input[contains(@id,"qu") and contains(@name,"que") and contains(@class,"sec")]    ${SPACE * 3}    空格键*3
    Sleep    3
    Input Text    //input[contains(@id,"qu") and contains(@name,"que") and contains(@class,"sec")]    ${EMPTY * 3}    空值*3
    Sleep    3
    Input Text    //input[contains(@id,"qu") and contains(@name,"que") and contains(@class,"sec")]    ${content}
    Sleep    5
    Log    根据下拉列表弹出的内容选择指定条目
    ${content2}    Get Text    //ul[contains(@class,'suglist')]//li[7]
    Log to console    ${content2}
    Click Element    //ul[contains(@class,'suglist')]//li[7]
    Sleep    3
    Page Should contain    ${content2} - 搜狗搜索
    Sleep    3
    ${myPageSource}    Get Source
    Should Contain    ${myPageSource}    ${content2} - 搜狗搜索
    Sleep    3
    Log to console    ${content2} - 搜狗搜索
    close browser
    [Teardown]    close browser

SearchOnWebWithList_Firefox
    [Documentation]    Firefox浏览器测试用例_下拉列表选择测试
    Log    设置UTF-8编码
    Log    打开Firefox浏览器，输入URL
    Open Browser    https://www.sogou.com    Firefox
    Maximize Browser Window
    Sleep    3
    Title should be    搜狗搜索引擎 - 上网从搜狗开始
    Sleep    3
    ${title}    Get Title
    Log to console    ${title}
    Should be equal as Strings    ${title}    搜狗搜索引擎 - 上网从搜狗开始
    Log    在输入框输入内容
    ${content}    Set Variable    雷诺
    Log to console    ${content}
    Input Text    //input[starts-with(@id,"qu") and starts-with(@name,"que") and starts-with(@class,"sec-")]    ${SPACE * 3}    空格键*3
    Sleep    3
    Input Text    //input[starts-with(@id,"qu") and starts-with(@name,"que") and starts-with(@class,"sec-")]    ${EMPTY * 3}    空值*3
    Sleep    3
    Input Text    //input[starts-with(@id,"qu") and starts-with(@name,"que") and starts-with(@class,"sec-")]    ${content}
    Sleep    5
    Log    根据下拉列表弹出的内容选择指定条目
    ${content2}    Get Text    //div//ul[@class="suglist"]//li[2]
    Log to console    ${content2}
    Click Element    //div//ul[@class="suglist"]//li[2]
    Sleep    3
    Page Should contain    ${content2} - 搜狗搜索
    Sleep    3
    ${myPageSource}    Get Source
    Should Contain    ${myPageSource}    ${content2} - 搜狗搜索
    Sleep    3
    Log to console    ${content2} - 搜狗搜索
    close browser
    [Teardown]    close browser

SearchOnWebWithList_Edge
    [Documentation]    Edge浏览器测试用例_下拉列表选择测试
    Log    设置UTF-8编码
    Log    打开Edge浏览器，输入URL
    Open Browser    https://www.sogou.com    Edge
    Maximize Browser Window
    Sleep    3
    Title should be    搜狗搜索引擎 - 上网从搜狗开始
    Sleep    3
    ${title}    Get Title
    Log to console    ${title}
    Should be equal as Strings    ${title}    搜狗搜索引擎 - 上网从搜狗开始
    Log    在输入框输入内容
    ${content}    Set Variable    红牛
    Log to console    ${content}
    Input Text    //input[starts-with(@id,"qu") and starts-with(@name,"que") and starts-with(@class,"sec-")]    ${SPACE * 3}    空格键*3
    Sleep    3
    Input Text    //input[starts-with(@id,"qu") and starts-with(@name,"que") and starts-with(@class,"sec-")]    ${EMPTY * 3}    空值*3
    Sleep    3
    Input Text    //input[starts-with(@id,"qu") and starts-with(@name,"que") and starts-with(@class,"sec-")]    ${content}
    Sleep    5
    Log    根据下拉列表弹出的内容选择指定条目
    ${content2}    Get Text    //ul[@class='suglist']//li[6]
    Log to console    ${content2}
    Click Element    //ul[@class='suglist']//li[6]
    Sleep    3
    Page Should contain    ${content2} - 搜狗搜索
    Sleep    3
    ${myPageSource}    Get Source
    Should Contain    ${myPageSource}    ${content2} - 搜狗搜索
    Sleep    3
    Log to console    ${content2} - 搜狗搜索
    close browser
    [Teardown]    close browser
