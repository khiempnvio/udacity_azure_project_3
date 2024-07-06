from selenium import webdriver

# Create a new instance of the Firefox driver
driver = webdriver.Firefox()

# Open a website
driver.get('http://www.google.com')

# Print the title of the current page
print(driver.title)

# Close the browser
driver.quit()