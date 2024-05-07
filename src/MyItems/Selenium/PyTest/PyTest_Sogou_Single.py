import pytest,os,time,PyTest_Browser
from selenium import webdriver
from selenium.webdriver.chrome.service import Service

"""
#@pytest.fixture
#@pytest.fixture(autouse=True)
def driver():
       
    IEDriver = os.path.join(os.path.abspath('.'),'Drivers','IEDriverServer.exe')
    #IEDriver = 'D:\Eason Code Project\Python-selenium\Selenium\Drivers\IEDriverServer.exe' 
    os.environ['webdriver.ie.driver'] = IEDriver
    ser = Service(IEDriver)
    driver = webdriver.Ie(service=ser)
    #yield driver
    return driver
    #driver.quit()
"""

def setup_function(function):
    global driver
    #driver = PyTest_Browser.IE()
    #driver = PyTest_Browser.Chrome()
    #driver = PyTest_Browser.Firefox()
    driver = PyTest_Browser.Edge()

def teardown_function(function):
    driver.quit()
    
def test_RunSearchOnSogou():
    driver.get('https://www.sogou.com')
    time.sleep(2)
    assert driver.title == '搜狗搜索引擎 - 上网从搜狗开始' 
    time.sleep(2)
    assert driver.title is not None 
    time.sleep(2)
    
def test_RunSearchOnSogou2():
    driver.get('https://www.sogou.com')
    time.sleep(2)
    assert driver.title == '搜狗搜索引擎 - 上网从搜狗开始22' #故意输有错的内容,目的是为了检查执行错误后是否会关闭浏览器执行下一个测试用例
    time.sleep(2)
    assert driver.title is not None 
    time.sleep(2)
        
def test_RunSearchOnBing():
    driver.get('https://www.bing.com')
    time.sleep(2)
    assert '必应' in driver.title 
    time.sleep(2)
    assert driver.title is not None 
    time.sleep(2)

if __name__ == '__main__':
    setup_function(test_RunSearchOnSogou)
    test_RunSearchOnSogou()
    teardown_function(test_RunSearchOnSogou)

    setup_function(test_RunSearchOnSogou2)
    test_RunSearchOnSogou()
    teardown_function(test_RunSearchOnSogou2)

    setup_function(test_RunSearchOnBing)
    test_RunSearchOnSogou()
    teardown_function(test_RunSearchOnBing)
