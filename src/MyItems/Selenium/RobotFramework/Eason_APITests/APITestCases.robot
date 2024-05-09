*** Settings ***
Library           RequestsLibrary

*** Variables ***
${URL_GET}        http://suggest.taobao.com/sug?code=utf-8&q=牛仔裤&callback=cb
${URL_POST}       http://suggest.taobao.com/sug
${Params}         code=utf-8&q=牛仔裤&callback=cb
${code}           utf-8
${q}              牛仔裤
${callback}       cb

*** Test Cases ***
Get_Demo
    ${result}    GET    ${URL_GET}
    Log    ${URL_GET}
    Log to console    ${URL_GET}
    Status should be    200
    Should be equal as Strings    ${result.status_code}    200
    Log    ${result.status_code}
    Log to console    ${result.status_code}
    Sleep    2
    Should contain    ${result.text}    牛仔裤
    Log    ${result.text}
    Log to console    ${result.text}
    Log    ${result.content}
    Log to console    ${result.content}
    Sleep    2
    should contain    ${result.headers}    Ups-Target-Key
    Log    ${result.headers}
    Log to console    ${result.headers}
    should contain    ${result.headers.values()}    suggest.taobao.com
    Log    ${result.headers.values()}
    Log to console    ${result.headers.values()}
    Log    ${result.close()}
    Log to console    ${result.close()}
    Request should be successful

Get_Demo_With_Wrong
    ${result}    GET    ${URL_GET}
    Log    ${URL_GET}
    Log to console    ${URL_GET}
    Status should be    200
    Should not be equal as Strings    ${result.status_code}    289
    Log    ${result.status_code}
    Log to console    ${result.status_code}
    Sleep    2
    Should Not Contain    ${result.text}    皮鞋
    Log    ${result.text}
    Log to console    ${result.text}
    Log    ${result.content}
    Log to console    ${result.content}
    Sleep    2
    should contain    ${result.headers}    Ups-Target-Key
    Log    ${result.headers}
    Log to console    ${result.headers}
    should contain    ${result.headers.values()}    suggest.taobao.com
    Log    ${result.headers.values()}
    Log to console    ${result.headers.values()}
    Log    ${result.close()}
    Log to console    ${result.close()}
    Request should be successful

Post_Demo
    ${headers}    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${Eason_Params}    Create dictionary    code=utf-8    q=牛仔裤    callback=cb
    ${Result_Post}    POST    ${URL_POST}    ${Eason_Params}    ${headers}
    Log    ${Result_Post.url}
    Log to console    ${Result_Post.url}
    Sleep    2
    Status should be    200
    Should be equal as Strings    ${Result_Post.status_code}    200
    Sleep    2
    Log    ${Result_Post.text}
    Log to console    ${Result_Post.text}
    Sleep    2
    Log    ${Result_Post.content}
    Log to console    ${Result_Post.content}
    Sleep    2
    Log    ${Result_Post.headers}
    Log to console    ${Result_Post.headers}
    Sleep    2
    Request should be successful

Post_Demo_With_Get_URL
    ${Eason_Params}    Create dictionary    code=utf-8    q=牛仔裤    callback=cb
    ${Result_Post}    POST    ${URL_GET}
    Log    ${Result_Post.url}
    Log to console    ${Result_Post.url}
    Sleep    2
    Status should be    200
    Should be equal as Strings    ${Result_Post.status_code}    200
    Sleep    2
    Log    ${Result_Post.text}
    Log to console    ${Result_Post.text}
    Should contain    ${Result_Post.text}    牛仔裤
    Sleep    2
    Log    ${Result_Post.content}
    Log to console    ${Result_Post.content}
    ${B}    convert to bytes    2899460.314355605
    Log    ${B}
    Log to console    ${B}
    Should contain    ${Result_Post.content}    ${B}
    Sleep    2
    Request should be successful

Post_Demo_With_Get_Wrong
    ${Eason_Params}    Create dictionary    code=utf-8    q=牛仔裤    callback=cb
    ${Result_Post}    POST    ${URL_GET}
    Log    ${Result_Post.url}
    Log to console    ${Result_Post.url}
    Sleep    2
    Status should be    200
    Should not be equal as Strings    ${Result_Post.status_code}    389
    Sleep    2
    Log    ${Result_Post.text}
    Log to console    ${Result_Post.text}
    Should not contain    ${Result_Post.text}    西装
    Sleep    2
    Log    ${Result_Post.content}
    Log to console    ${Result_Post.content}
    ${B}    convert to bytes    99982772277222
    Log    ${B}
    Log to console    ${B}
    Should not contain    ${Result_Post.content}    ${B}
    Sleep    2
    Request should be successful

Post_Demo_With_Params
    ${Eason_Params}    Create Dictionary    code=utf-8    q=牛仔裤    callback=cb
    Log    ${Eason_Params}
    Log to console    ${Eason_Params}
    ${Result_Post}    POST    ${URL_POST}    ${Eason_Params}
    Log    ${Result_Post.url}
    Log to console    ${Result_Post.url}
    Sleep    2
    Status should be    200
    Should be equal as Strings    ${Result_Post.status_code}    200
    Sleep    2
    Log    ${Result_Post.text}
    Log to console    ${Result_Post.text}
    Should be empty    ${Result_Post.text}
    Sleep    2
    Log    ${Result_Post.content}
    Log to console    ${Result_Post.content}
    ${B}    convert to bytes    2899460.314355605
    Log    ${B}
    Log to console    ${B}
    Should be empty    ${Result_Post.content}
    Sleep    2
    Request should be successful
