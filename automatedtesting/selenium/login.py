from selenium import webdriver

# Set the path to the GeckoDriver executable
gecko_path = '/path/to/geckodriver'

# Create a new instance of the Firefox driver
driver = webdriver.Firefox(executable_path=gecko_path)

# Open a website
driver.get('http://www.google.com')

# Print the title of the current page
print(driver.title)

# Close the browser
driver.quit()