import header from "./component/header.js";

const apiUrl = `http://localhost:6000/api/v1/auth/signin`;

const headerContainer = document.querySelector(".header");
const contentContainer = document.querySelector(".center-container");

function setCookie(cname, cvalue, exdays) {
  const d = new Date();
  d.setTime(d.getTime() + exdays * 24 * 60 * 60 * 1000);
  let expires = "expires=" + d.toUTCString();
  document.cookie = `${cname}=${cvalue};${expires};path=/`;
}

function getCookie(cname) {
  let name = cname + "=";
  let decodedCookie = decodeURIComponent(document.cookie);
  let ca = decodedCookie.split(";");
  for (let i = 0; i < ca.length; i++) {
    let c = ca[i];
    while (c.charAt(0) == " ") {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length);
    }
  }
  return "";
}

const app = {
  async signIn(username, password) {
    const res = await fetch(apiUrl, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        username,
        password,
      }),
    });
    return res.json();
  },
  handleEvents() {
    const pwd_inputs = document.querySelectorAll("input[type='password']");
    const pwd_icons = document.querySelectorAll(".form-icon");
    const loginBtn = document.querySelector(".login-btn");

    if (pwd_icons) {
      pwd_icons.forEach((pwd_icon, index) => {
        pwd_icon.onclick = () => {
          pwd_inputs[index].type === "password"
            ? (pwd_inputs[index].type = "text")
            : (pwd_inputs[index].type = "password");
          pwd_icon.querySelectorAll("i").forEach((icon) => {
            icon.classList.toggle("active");
          });
        };
      });
    }
    if (loginBtn) {
      loginBtn.onclick = (e) => {
        e.preventDefault();
        const usernameInput = document.querySelector("input[name='username']");
        const passwordInput = document.querySelector("input[name='password']");
        this.signIn(usernameInput.value, passwordInput.value)
          .then((data) => {
            // console.log(data);
            if (data.success) {
              window.location.href = `${window.origin}/FE/index.html`;
              setCookie("token", data.data.token, 1);
              Object.keys(data.data.user).forEach((key) =>
                setCookie(`${key}`, data.data.user[key])
              );
              console.log(getCookie("id"));
            } else {
              const pwdFormGroup = passwordInput.parentElement;
              pwdFormGroup.classList.add("invalid");
              pwdFormGroup.querySelector(
                ".form-message"
              ).innerText = `Mật khẩu không chính xác`;
            }
          })
          .catch((err) => {});
      };
    }
  },

  init() {
    header.init();
    headerContainer.innerHTML = header.headerHtml;
    contentContainer.innerHTML = `
      <form action="" class="form-authentication" id="form-login">
        <div class="form-title">
            <h3>Đăng nhập</h3>
        </div>
        <div class="form-list">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Tên đăng nhập" name="username">
                <span class="form-message"></span>
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="Mật khẩu" name="password">
                <div class="form-icon">
                    <i class="fa-solid fa-eye active"></i>
                    <i class="fa-solid fa-eye-slash"></i>
                </div>
                <span class="form-message"></span>
            </div>
        </div>
        <button class="btn btn-primary btn-full login-btn">ĐĂNG NHẬP</button>
        <div class="form-footer">
            <span>Bạn mới biết đến Boardgame KTPM?</span>
            <a href="register.html" class="primary-link">&nbsp;Đăng ký</a>
        </div>
      </form>`;
    this.handleEvents();
  },
};

export default app;
