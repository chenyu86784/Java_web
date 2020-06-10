// Get current date
var today = new Date();
var day = today.getDate();
var out = document.getElementById("date");
out.innerHTML = day;

// Time
$(document).ready(function() {
	setInterval(function(){
		getTime();
	}, 50);
	function getTime() {
		var d = new Date();
		var s = d.getSeconds() + (d.getMilliseconds()/1000);
		var m = d.getMinutes();
		var h = hour12();	
		$(".hand-sec").css("transform", "rotateZ(" + s*6 + "deg)");
    // Smoother minute hand transition. Thanks Michel Poulain @poulain !
    $(".hand-min").css("transform", "rotateZ(" + (m*6+s*0.1) + "deg)");
		$(".hand-hour").css("transform", "rotateZ(" + (h*30 + m*0.5) + "deg)");
		function hour12() {
			var hour = d.getHours();
			if(hour >= 12) {
				hour = hour-12;
			}
			if(hour == 0) {
				h = 12;
			}
			return hour;
		}
	}
  
  // Rotate day wheel based on day of the week. Thanks Kaa Kihe @simplesessions!
  const ROTATE_DELTA = 51.42857 /* 360 / 7 */
  const getRotateFactor = day => day * ROTATE_DELTA
  const rotate = el => 
  el.style.transform = `rotate(-${getRotateFactor(day)}deg)`
  let day = (new Date()).getDay()
  const updateDay = e => {
    day += 1
    rotate(e.target)
  }
  const dayWrapper = document.querySelector('.day-wrapper')
  rotate(dayWrapper)

  setTimeout(() => {
    const lastDay = day
    day = (new Date()).getDay()
    if (day !== lastDay) {
      day += 1
      rotate(dayWrapper)
    }
  }, 1000)
});