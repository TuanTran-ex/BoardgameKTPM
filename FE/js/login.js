import header from "./component/header.js";

const apiUrl = `http://localhost:6000/api/v1/auth/signin`;

const headerContainer = document.querySelector(".header");
const contentContainer = document.querySelector(".center-container");

const app = {
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

        // Call Login API
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
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="Mật khẩu" name="password">
                <div class="form-icon">
                    <i class="fa-solid fa-eye active"></i>
                    <i class="fa-solid fa-eye-slash"></i>
                </div>
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
