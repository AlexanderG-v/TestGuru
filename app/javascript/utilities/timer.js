document.addEventListener("turbolinks:load", () => {
  let timer = document.querySelector(".timer");

  if (timer) {
    startTimer(timer);
  }
});

function startTimer(timer) {
  let startTime = new Date(timer.dataset.time_start).getTime();
  let duration = parseInt(timer.dataset.duration) * 60 * 1000;
  let endTime = new Date(startTime + duration).getTime();

  const timerInterval = setInterval(() => {
    let currentTime = new Date().getTime();
    let current = endTime - currentTime;

    if (current <= 0) {
      clearInterval(timerInterval);
      document.getElementsByClassName("submit")[0].click();
    } else {
      let minutes = parseInt(current / 60000);
      let seconds = parseInt(current % 60000) / 1000;

      minutes = minutes < 10 ? "0" + minutes : minutes;
      seconds = seconds < 10 ? "0" + seconds.toFixed(0) : seconds.toFixed(0);

      timer.innerHTML = minutes + ":" + seconds;
    }
  }, 1000);
}
