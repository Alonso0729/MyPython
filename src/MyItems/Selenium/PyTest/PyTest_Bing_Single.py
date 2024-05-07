import pytest,os,time,PyTest_Browser
from selenium import webdriver

# 每个测试运行前都会执行的方法
def setup_function(function):
    global driver
    #driver = webdriver.Chrome()
    driver = PyTest_Browser.Chrome()
    driver.implicitly_wait(10)

# 每个测试运行后都会执行的方法
def teardown_function(function):
    driver.quit()

# 第一个测试方法
def test_open_bing_homepage_first():
    driver.get("https://www.bing.com")
    assert "必应" in driver.title

# 第二个测试方法
def test_open_bing_homepage_second():
    driver.get("https://www.bing.com")
    assert "必应" in driver.title

if __name__ == "__main__":
    setup_function(test_open_bing_homepage_first)
    test_open_bing_homepage_first()
    teardown_function(test_open_bing_homepage_first)
    
    setup_function(test_open_bing_homepage_second)
    test_open_bing_homepage_second()
    teardown_function(test_open_bing_homepage_second)
