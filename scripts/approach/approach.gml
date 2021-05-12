// Approach script
function approach(currentVal, targetVal, changeAmount){
	if (currentVal < targetVal) {
		currentVal += changeAmount;
		currentVal = min(currentVal, targetVal);
	}
	else {
		currentVal -= changeAmount;
		currentVal = max(currentVal, targetVal);
	}
	
	return currentVal;
}