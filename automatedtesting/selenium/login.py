from selenium import webdriver
from selenium.webdriver.common.by import By

login_url = 'https://www.saucedemo.com/'

def driver_config():
    print ('Starting the browser...')
    return webdriver.Firefox();

def login(driver, user, password):
    driver.get(login_url)
    driver.find_element(By.ID, "user-name").send_keys(user)
    driver.find_element(By.ID, "password").send_keys(password)
    driver.find_element(By.ID, "login-button").click()
    print('Login successfully')

def add_items_to_cart(driver):
    driver.find_element(By.ID, "add-to-cart-sauce-labs-backpack").click()  
    print('Added Sauce Labs Backpack item to cart.')

def remove_items_from_card(driver):
    driver.find_element(By.ID, "remove-sauce-labs-backpack").click()  
    print('Remove Sauce Labs Backpack from cart Success.')

def run_test():
    
    driver = driver_config()
    print("Browser started!")
    print("Begin UI Test") 
    print("Login website saucedemo") 
    login(driver, 'standard_user', 'secret_sauce')
    print("--Begin Add item to cart")
    add_items_to_cart(driver)
    print("--End Add item to cart")
    print("--Begin Remove item from cart")
    remove_items_from_card(driver)
    print("--End Remove item from cart")
    driver.quit()
    print("Completed")

if __name__ == "__main__":
    run_test()