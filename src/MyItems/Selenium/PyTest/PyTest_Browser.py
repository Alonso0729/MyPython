import pytest,os
from selenium import webdriver
from selenium.webdriver.chrome.service import Service

def IE():
    if os.name == 'nt':
        IEDriver = os.path.join(os.path.abspath('..'),'Drivers','IEDriverServer.exe')
        #IEDriver = 'D:\Eason Code Project\Python-selenium\Selenium\Drivers\IEDriverServer.exe' 
        os.environ['webdriver.ie.driver'] = IEDriver
        ser = Service(IEDriver)
        driver = webdriver.Ie(service=ser)
        driver.maximize_window()

    else:
        print ("IE cannot be ran on non-Windows system!")
    #yield driver
    return driver
    #driver.quit()

def Chrome():
    if 'nt' in os.name :
        CDriver = os.path.join(os.path.abspath('..'),'Drivers','chromedriver.exe')
        #CDriver = 'D:\Eason Code Project\Python-selenium\Selenium\Drivers\chromedriver.exe' 

    elif "posix" in os.name:
        CDriver = os.path.join(os.path.abspath('..'),'Drivers','chromedriver')
        #CDriver = 'D:\Eason Code Project\Python-selenium\Selenium\Drivers\chromedriver' 

    os.environ['webdriver.chrome.driver'] = CDriver
    ser = Service(CDriver)
    driver = webdriver.Chrome(service=ser)
    driver.maximize_window()
    #yield driver
    return driver
    #driver.quit()

def Firefox():
    if not os.name == 'nt':
        FFDriver = os.path.join(os.path.abspath('..'),'Drivers','geckodriver')
        #FFDriver = 'D:\Eason Code Project\Python-selenium\Selenium\Drivers\geckodriver'
        os.environ['webdriver.gecko.driver'] = FFDriver

    elif not os.name == 'posix':
        FFDriver = os.path.join(os.path.abspath('..'),'Drivers')
        #FFDriver = 'C:\Program Files\Mozilla Firefox'
        os.environ['PATH'] = FFDriver

    driver = webdriver.Firefox()
    driver.maximize_window()
    #yield driver
    return driver
    #driver.quit()

def Edge():
    if not "nt" in os.name:
        print ("Edge cannot be ran on non-Windows system!")

    else:
        EDriver = os.path.join(os.path.abspath('..'),'Drivers','msedgedriver.exe')
        #IEDriver = 'D:\Eason Code Project\Python-selenium\Selenium\Drivers\msedgedriver.exe' 
        os.environ['webdriver.edge.driver'] = EDriver
        ser = Service(EDriver)
        driver = webdriver.Edge(service=ser)
        driver.maximize_window()
        
    #yield driver
    return driver
    #driver.quit()
    
