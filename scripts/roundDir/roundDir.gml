// Forces direction number to closest degree
function roundDir(num){
	var newNum = 0;
	if (num > 0 && num < 30) {
		newNum = 0;
	} else if ((num >= 30 && num <= 45) || (num > 45 && num < 60)) {
		newNum = 45;
	} else if ((num >= 60 && num <= 90) || (num > 90 && num < 120)) {
		newNum = 90;
	} else if ((num >= 120 && num <= 135) || (num > 135 && num < 150)) {
		newNum = 135;
	} else if ((num >= 150 && num <= 180) || (num > 180 && num < 210)) {
		newNum = 180;
	} else if ((num >= 210 && num <= 225) || (num > 225 && num < 250)) {
		newNum = 225;
	} else if ((num >= 250 && num <= 270) || (num > 270 && num < 290)) {
		newNum = 270;
	} else if ((num >= 290 && num <= 315) || (num > 315 && num < 360)) {
		newNum = 315;
	} else {
		newNum = 0;
	}
	return newNum;
}