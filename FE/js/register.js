import header from "./component/header.js";
import modal from "./component/modal.js";

const headerContainer = document.querySelector(".header");
const contentContainer = document.querySelector(".center-container");

const app = {
  handleEvents() {
    const pwd_inputs = document.querySelectorAll("input[type='password']");
    const pwd_icons = document.querySelectorAll(".form-icon");

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
  },

  init() {
    header.init();
    headerContainer.innerHTML = header.headerHtml;
    contentContainer.innerHTML = `
        <form action="" class="form-authentication" id="form-register">
            <div class="form-title">
                <h3>Đăng ký</h3>
            </div>
            <div class="form-list">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Tên đăng nhập" name="username">
                    <span class="form-message"></span>
                </div>
                <div class="form-group">
                    <input type="email" class="form-control" placeholder="Email" name="email">
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
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="Nhập lại mật khẩu" name="repassword">
                    <div class="form-icon">
                        <i class="fa-solid fa-eye active"></i>
                        <i class="fa-solid fa-eye-slash"></i>
                    </div>
                    <span class="form-message"></span>
                </div>
            </div>
            <button class="btn btn-primary btn-full">ĐĂNG KÝ</button>
            <span class="form-text">Bằng việc đăng kí, bạn đã đồng ý với Boardgame KTPM về <br>
                <span class="primary-text"> Điều khoản dịch vụ </span>
                &
                <span class="primary-text">Chính sách bảo mật</span>
            </span>
            <div class="form-footer">
                <span>Bạn đã có tài khoản?</span>
                <a href="login.html" class="primary-link">&nbsp;Đăng nhập</a>
            </div>
        </form>
    `;
    // footerContainer.innerHTML = footer;
    Validator({
      form: "#form-register",
      formGroupSelector: ".form-group",
      errorSelector: ".form-message",
      rules: [
        Validator.isRequired(
          'input[name="username"]',
          "Vui lòng nhập tên đăng nhập"
        ),
        Validator.isRequired('input[name="email"]', "Vui lòng nhập email"),
        Validator.isEmail('input[name="email"]'),
        Validator.isRequired(
          'input[name="password"]',
          "Vui lòng nhập mật khẩu"
        ),
        Validator.minLength('input[name="password"]', 6),
        Validator.isRequired('input[name="repassword"]'),
        Validator.isConfirmed(
          'input[name="repassword"]',
          function () {
            return document.querySelector(
              '#form-register input[name="password"]'
            ).value;
          },
          "Mật khẩu nhập lại không trùng khớp"
        ),
      ],
      onSubmit: function (data) {
        console.log(data);

        // Call Register API

        // Pop up modal
        document.querySelector("body").innerHTML += `
            <div class="modal active">
                <div class="modal-overlay"></div>
                <div class="modal-body">
                    <div class="notification">
                        <i class="fa-regular fa-circle-check"></i>
                        <span>Đăng ký thành công</span>
                    </div>
                </div>
            </div>
        `;
      },
    });

    this.handleEvents();
    modal.handleEvents();
  },
};

export default app;
