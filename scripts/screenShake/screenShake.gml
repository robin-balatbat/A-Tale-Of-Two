// Cause scren shaking
function screenShake(magnitude, frames){
	with(obj_Camera) {
		if (magnitude > shake_remain) {
			shake_magnitude = magnitude;
			shake_remain = magnitude;
			shake_length = frames;
		}
	}
}