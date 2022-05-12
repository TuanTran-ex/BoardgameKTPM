import header from "./component/header.js";
import footer from "./component/footer.js";
import userSideBar from "./component/userSideBar.js";
import userHeader from "./component/userHeader.js";
import userContent from "./component/userContent.js";
import utils from "./utils/utils.js";

const footerContainer = document.querySelector(".footer");
const userContainer = document.querySelector(".user");

const user = {
    avatar: utils.getCookie("Avatar"),
    username: utils.getCookie("Username"),
    fullname: utils.getCookie("FullName"),
    email: utils.getCookie("Email"),
    phone: utils.getCookie("Phone"),
    address: utils.getCookie("Address"),
    gender: utils.getCookie("Gender"),
    birthdate: utils.getCookie("DOB")
}

let accountBtn;
let accountPwdBtn;
let accountEditBtn;
let accountHistoryBtn;

const app = {
    page: {},
    renderHtml() {
        userContainer.innerHTML = `
        <div class="user-sidebar"></div>
        <div class="user-info">
            <div class="user-info-header">
            </div>
            <div class="user-info-container">
            </div>
        </div>
        `
        userSideBar.init(user, this.page);
        userHeader.init(this.page);
        userContent.init(user, this.page);
    },
    init() {
        if (utils.getCookie("token")) {
            header.init();
            footerContainer.innerHTML = footer;
            this.page.code = 2;
            this.renderHtml();
        } else {
            window.location.href = `${window.location.origin}/FE/index.html`
        }
  },
};

export default app;

// Page.code
//      0: Xem hồ sơ 
//      1: Sửa hồ sơ
//      2: Đổi mật khẩu
//      3: Lịch sử mua hàng