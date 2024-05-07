import pytest,time,os,PyTest_Browser
from selenium import webdriver

class TestBingHomepage:
    # 每个测试方法运行前都会执行setup_method
    def setup_method(self):
        #self.driver = webdriver.Chrome()
        self.driver = PyTest_Browser.Chrome()
        self.driver.implicitly_wait(10)

    # 每个测试方法运行后都会执行teardown_method
    def teardown_method(self):
        self.driver.quit()

    # 第一个测试方法
    def test_open_bing_homepage_first(self):
        self.driver.get("https://www.bing.com")
        assert "必应" in self.driver.title

    # 第二个测试方法
    def test_open_bing_homepage_second(self):
        self.driver.get("https://www.bing.com")
        assert "必应" in self.driver.title

if __name__ == "__main__":
    pytest.main()
