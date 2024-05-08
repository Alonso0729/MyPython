import pytest,os,time,unittest,PyTest_EasonBrowser,HTMLTestReport
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys

def SearchOnSogou(self,driver,content):
    driver.get('https://www.sogou.com')
    time.sleep(5)
    #assertTrue('搜狗搜索引擎 - 上网从搜狗开始' , driver.title)
    assert '搜狗搜索引擎 - 上网从搜狗开始' in driver.title #Pytest中的断言是assert的语法,与unittest框架的断言语法不一样
    time.sleep(5)

    content2 = ''
    driver.execute_script('arguments[0].value=arguments[1]' , driver.find_element(By.XPATH,'//input[contains(@id,"qu") and contains(@name,"que") and contains(@class,"sec")]'),Keys.BACKSPACE)
    time.sleep(5)
    driver.execute_script('arguments[0].value=arguments[1]' , driver.find_element(By.XPATH,'//input[@id="query" and @name="query" and @class="sec-input active"]') , content)
    time.sleep(5)

    content2 = driver.find_element(By.XPATH,'//ul[starts-with(@class,"sugli")]//li[6]').text
    #driver.find_element(By.XPATH,'//ul[starts-with(@class,"sugli")]//li[6]').click()
    driver.execute_script('arguments[0].click()' , driver.find_element(By.XPATH,'//ul[starts-with(@class,"sugli")]//li[6]'))
    time.sleep(3)

    assert content2 + ' - 搜狗搜索' in driver.page_source
    time.sleep(2)
    print (driver.title)
    time.sleep(2)

class TestSearchOnSogou: #类方法一定要以Test开头,否则无法被识别到并运行
    '''
    def setup_method(self):
        self.driver = PyTest_EasonBrowser.IE()
    '''
    def teardown_method(self):
        self.driver.quit()
    
    def testbIE(self):
        self.driver = PyTest_EasonBrowser.IE()
        driver = self.driver
        SearchOnSogou(self,driver,'IE')
    
    def testcChrome(self):
        self.driver = PyTest_EasonBrowser.Chrome()
        driver = self.driver
        SearchOnSogou(self,driver,'Chrome')
    
    def testdFirefox(self):
        self.driver = PyTest_EasonBrowser.Firefox()
        driver = self.driver
        SearchOnSogou(self,driver,'Firefox')
    
    def testaEdge(self):
        self.driver = PyTest_EasonBrowser.Edge()
        driver = self.driver
        SearchOnSogou(self,driver,'Edge')

if __name__ == '__main__':
    pytest.main()
    #unittest.main()
    #HTMLTestReport.HTMLTestReport('EasonCase.py')
