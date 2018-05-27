*** Settings ***
Library          SeleniumLibrary
Library          pixelartmakerlibrary.py
Variables        variables.py

*** Keywords ***
Open browser to application page
    Open browser           ${APPLICATION}    ${BROWSER}
	Application page should be open

Grid height
    [Arguments]    ${height}
	Input text     height     ${height}
	Set Test Variable    ${height}

Grid width
    [Arguments]    ${width}
    Input text     width      ${width}
	Set Test Variable    ${width}

Submit grid
    Click Button    Submit

Application page should be open
    Title should be    Pixel Art Maker!

Grid height and width should be correct
    :FOR    ${height}    IN RANGE    1    ${height}+1
    \    Element Should Be Visible    xpath=//*[@id="pixel_canvas"]/tbody/tr[${height}]/td[${width}]
    \    Grid width should be    ${height}    ${width}

Grid width should be
    [Arguments]    ${height}    ${width}
    :FOR    ${width}    IN RANGE    1    ${width}+1
    \    Element Should Be Visible    xpath=//*[@id="pixel_canvas"]/tbody/tr[${height}]/td[${width}]

Select color    
    [Arguments]    ${color}
	Execute Javascript    $("#colorPicker").val("${color}");
    ${cellcolor} =    Execute Javascript    return $("#colorPicker").val();
	Set Test Variable    ${cellcolor}

Draw table cell row and column
    [Arguments]      ${height}    ${width}
	${pixel} =    Catenate    xpath=//*[@id="pixel_canvas"]/tbody/tr[${height}]/td[${width}]    
	Click Element     ${pixel}
    Set Test Variable    ${pixel}
	
Table cell color should be correct
    ${bgcolor} =    Get Element Attribute    ${pixel}    style
	${rgbcolor} =    Get Element Attribute Value    ${bgcolor}
	${hexcolor} =    Rgb to Hex    ${rgbcolor}
    Should be equal    ${hexcolor}    ${cellcolor}   

