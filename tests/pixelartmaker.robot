*** Settings ***
Resource        libraries/framework.robot

*** Test Cases ***
Open application
    Open browser to application page
    Application page should be open
    [Teardown]    Close browser

Create grid
    Open browser to application page
    Grid height    5
    Grid width     5
    Submit grid
	Grid height and width should be correct
    [Teardown]    Close browser

Draw pixel
    Open browser to application page
    Grid height     6
    Grid width      8
    Submit grid
    Select color    \#ff8080
	Draw table cell row and column      3    2
	Table cell color should be correct
    [Teardown]    Close browser
