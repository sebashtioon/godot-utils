#############################################
# Name:      Format number function
# Description: A function that formats numbers and shortens
#              them, based on the metric prefix.
#############################################
func format_number(number: int) -> String:
	if number >= 1_000:
		var i:float = snapped(float(number)/1_000, .01)
		return str(i).replace(",", ".") + "k"
	elif number >= 1_000_000:

		var i:float = snapped(float(number)/1_000_000, .01)
		return str(i).replace(",", ".") + "M"
	elif number >= 1_000_000_000:

		var i:float = snapped(float(number)/1_000_000_000, .01)
		return str(i).replace(",", ".") + "B"
	elif number >= 1_000_000_000_000:

		var i:float = snapped(float(number)/1_000_000_000_000, .01)
		return str(i).replace(",", ".") + "T"
	elif number >= 1_000_000_000_000_000:

		var i:float = snapped(float(number)/1_000_000_000_000_000, .01)
		return str(i).replace(",", ".") + "P"

        # NOTE: This function only formats numbers within the Quadrillion (P) range.
        # If you would like to add more prefixes, copy the elif statements and add them 
        # below this comment (but before the else statement obviously) There is a template below:
        # (replace everything in the curly braces {} )

    ## elif number >= {SOME_POWER_OF_TEN}:

		## var i:float = snapped(float(number)/{SOME_POWER_OF_TEN}, .01)
		## return str(i).replace(",", ".") + "{METRIC_PREFIX_LETTER}"

	else:
		# ran otherwise
		return str(number)