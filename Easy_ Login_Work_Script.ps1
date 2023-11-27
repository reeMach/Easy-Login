# Load the Selenium WebDriver module
Import-Module Selenium

# Specify the path to the ChromeDriver executable
$chromeDriverPath = "C:\Path\To\chromedriver"

# Specify the URL of the website you want to visit
$websiteUrl = "https:/website.com"

# Specify the login credentials
$username = "testcredentials"
$password = "123456789"

# Start Google Chrome 
Start-Process "chrome.exe" -ArgumentList "about:blank"

# Wait for Chrome to open
for ($i = 1; $i -le 5; $i++) {
    Write-Host $i
    Start-Sleep -Seconds 1
}

# Set up the Chrome options
$chromeOptions = New-Object OpenQA.Selenium.Chrome.ChromeOptions
$chromeOptions.AddArgument("--disable-extensions")

# Create a Chrome WebDriver
$chromeDriver = New-Object OpenQA.Selenium.Chrome.ChromeDriver($chromeDriverPath, $chromeOptions)

# Navigate to the website
$chromeDriver.Navigate().GoToUrl($websiteUrl)

# Locate and interact with the login form elements
Start-Sleep -Seconds 3
$usernameField = $chromeDriver.FindElementById("login")  # replace "username" with the actual name attribute of the username field
Start-Sleep -Seconds 3
$passwordField = $chromeDriver.FindElementById("passwd")  # replace "password" with the actual name attribute of the password field
Start-Sleep -Seconds 3
$submitButton = $chromeDriver.FindElementById("nsg-x1-logon-button")  # replace "submit" with the actual name attribute of the submit button

# Enter login credentials
$usernameField.SendKeys($username)
$passwordField.SendKeys($password)

# Submit the form
$submitButton.Submit()

# Wait for a few seconds to allow the login process to complete
for ($i = 1; $i -le 5; $i++) {
    Write-Host " Closing in $i"
    Start-Sleep -Seconds 1
}

# Close the Chrome WebDriver
$chromeDriver.Quit()
