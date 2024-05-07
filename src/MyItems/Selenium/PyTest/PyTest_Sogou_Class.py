import pytest,os,time,PyTest_Browser
from selenium import webdriver
from selenium.webdriver.chrome.service import Service

class TestSogou():
    def setup_method(myClass): #also setup_method(self) 
        #myClass.driver = PyTest_Browser.IE()
        #myClass.driver = PyTest_Browser.Chrome()
        #myClass.driver = PyTest_Browser.Firefox()
        myClass.driver = PyTest_Browser.Edge()

        #self.driver = PyTest_Browser.IE()
        #self.driver = PyTest_Browser.Chrome()
        #self.driver = PyTest_Browser.Firefox()
        #self.driver = PyTest_Browser.Edge()

    def teardown_method(self):
        self.driver.quit()

    def test_RunSearchOnSogou(myClass):
        driver = myClass.driver
        driver.get('https://www.sogou.com')
        time.sleep(2)
        assert driver.title == '搜狗搜索引擎 - 上网从搜狗开始' 
        time.sleep(2)
        assert driver.title is not None 
        time.sleep(2)

    def test_RunSearchOnSogou2(self):
        driver = self.driver
        driver.get('https://www.sogou.com')
        time.sleep(2)
        assert driver.title == '搜狗搜索引擎 - 上网从搜狗开始22' #故意输有错的内容,目的是为了检查执行错误后是否会关闭浏览器执行下一个测试用例
        time.sleep(2)
        assert driver.title is not None 
        time.sleep(2)
        
    def test_RunSearchOnBing(self):
        driver = self.driver
        driver.get('https://www.bing.com')
        time.sleep(2)
        assert '必应' in driver.title 
        time.sleep(2)
        assert driver.title is not None 
        time.sleep(2)

if __name__ == '__main__':
    pytest.main()
