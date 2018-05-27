from selenium.webdriver.support.color import Color


def rgb_to_hex(rgb):
    return Color.from_string(rgb).hex

def get_element_attribute_value(property):
	value = property.replace(";", "")
	value = value.split(":")
	return value[1]

