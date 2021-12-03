document.addEventListener("turbolinks:load", () => {
  let controls = document.querySelector(".submit");

  if (controls) {
    currentProgress();
    controls.addEventListener("click", currentProgress);
  }
});

const currentProgress = (event) => {
  let current_question = document.querySelector(".progress").dataset.currentNumber - 1;
  let total_questions = document.querySelector(".progress").dataset.totalQuestions;
  let result_percentage = (100 / total_questions).toFixed(0) * current_question;
  let item = document.querySelector(".progress-bar");

  item.style.width = result_percentage + "%";
  item.innerHTML = result_percentage + "%";
};
