document.addEventListener("turbolinks:load", () => {
  const password2 = document.querySelectorAll("user_password_confirmation");
  if (password2) {
    document
      .querySelector("#new_user")
      .addEventListener("input", passwordConfirmation);
  }
});

const passwordConfirmation = () => {
  const password1 = document.querySelector("#user_password");
  const password2 = document.querySelector("#user_password_confirmation");
  if (!password2.value) {
    password2.parentNode
      .querySelector(".octicon-thumbsdown")
      .classList.add("hide");
    password2.parentNode
      .querySelector(".octicon-thumbsup")
      .classList.add("hide");
    return;
  }
  if (password1.value !== password2.value) {
    password2.parentNode
      .querySelector(".octicon-thumbsdown")
      .classList.remove("hide");
    password2.parentNode
      .querySelector(".octicon-thumbsup")
      .classList.add("hide");
  } else {
    password2.parentNode
      .querySelector(".octicon-thumbsdown")
      .classList.add("hide");
    password2.parentNode
      .querySelector(".octicon-thumbsup")
      .classList.remove("hide");
  }
};
