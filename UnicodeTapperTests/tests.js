
var target = UIATarget.localTarget();
var window = target.frontMostApp().mainWindow();

// Dump element tree to log
target.logElementTree();

// Verify that "!" is the first character displayed
//
// NOTE: Getting the value of a UILabel in this way requires
// setting both the accessibilityIdentifier and accessibilityLabel
// of the UILabel you want to examine. As of Xcode 4.3.3 the
// accessibilityIdentifier must be set in code; IB doesn't expose it:
var charDisplayed = window.staticTexts()["bigCharLabel"].value();
if (charDisplayed == "!") {
    UIALogger.logPass("Exclamation point displayed at startup");
} else {
    UIALogger.logFail("Incorrect character displayed: " + charDisplayed);
}

// Verify that the message shown in the top bar is correct for the "!" character
var topBarText = window.staticTexts()["topBarLabel"].value();
if (topBarText == "Unicode code point: U+0021") {
    UIALogger.logPass("Correct top bar text found");
} else {
    UIALogger.logFail("Incorrect top bar text displayed: " + topBarText);
}

// Tap the next character button
target.frontMostApp().mainWindow().buttons()["Display Next Character"].tap();

// Verify that the quotation mark char is now displayed
charDisplayed = window.staticTexts()["bigCharLabel"].value();
if (charDisplayed == "\"") {
    UIALogger.logPass("Expected character displayed");
} else {
    UIALogger.logFail("Incorrect character displayed: " + charDisplayed);
}

// Verify that the message shown in the top bar is correct
var topBarText = window.staticTexts()["topBarLabel"].value();
if (topBarText == "Unicode code point: U+0022") {
    UIALogger.logPass("Correct top bar text found");
} else {
    UIALogger.logFail("Incorrect top bar text displayed: " + topBarText);
}
