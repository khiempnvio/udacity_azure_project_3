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

def add_items_to_cart(driver, count):
    for i in range(count):
        element = "a[id='item_" + str(i) + "_title_link']"  
        driver.find_element(By.CSS_SELECTOR, element).click()  
        driver.find_element(By.CSS_SELECTOR, "button.btn_primary.btn_inventory").click()  
        product = driver.find_element(By.CSS_SELECTOR, '.inventory_details_name.large_size').text  
        driver.find_element(By.CSS_SELECTOR, "button.inventory_details_back_button").click()  
    print('Added {:d} items to cart.'.format(count))

def remove_items_from_card(driver):
    driver.find_element(By.CLASS_NAME, 'shopping_cart_link').click()
    car_item = driver.find_elements(By.CLASS_NAME, 'cart_item')
    print("Begin remove {:d} items in cart".format(len(car_item)))
    for item in car_item:
        item_name = item.find_element(By.CLASS_NAME, 'inventory_item_name').text
        item.find_element(By.CLASS_NAME, 'cart_button').click()
        logging.info('Removed {:s} from cart'.format(item_name))
    print('Test Remove Items from cart Success.')

def run_test():
    
    driver = driver_config()
    print("Browser started!")
    print("Begin UI Test") 
    print("--Begin Add items to cart")
    add_items_to_cart(driver, 3)
    print("--End Add items to cart")
    print("--Begin Remove items from cart")
    remove_items_from_card(driver)
    print("--End Remove items from cart")
    driver.quit()
    print("Completed")

if __name__ == "__main__":
    run_test()