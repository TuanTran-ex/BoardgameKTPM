import utils from "../utils/utils.js";

const originUrl = `${window.origin}/FE`;

const product = {
  image: "pd001.jpg",
  name: "Catan US",
  price: "1.600.000 VNĐ",
};

let cartBtn;

let user = utils.getCookie("token") ? 
  {
    username: utils.getCookie("Username"),
    avatar: utils.getCookie("Avatar"),
  } : {};

const header = {
  productList: [],
  renderHtml() {
    // Get cart from session
    if (!window.sessionStorage.cart) {
      window.sessionStorage.cart = JSON.stringify([]);
    } else {
      this.productList = [...JSON.parse(window.sessionStorage.cart)];
    }

    document.querySelector(".header").innerHTML = `
      <div class="header-nav">
            <a href="${originUrl}/index.html" class="header-logo-link">
                <img src="${originUrl}/img/logo.png" alt="" class="logo">
            </a>
            <ul class="header-nav-list">
                <li class="header-nav-item">
                    <a href="${originUrl}/index.html" class="header-nav-link">Trang chủ</a>
                </li>
                <li class="header-nav-item">
                    <a href="${originUrl}/pages/about_us.html" class="header-nav-link">Về chúng tôi</a>
                </li>
            </ul>
        </div>
        <div class="header-btn">
            <a href="${originUrl}/pages/cart.html">
                <div class="header-cart">
                    <i class="fa-solid fa-cart-shopping"></i>
                    <div class="header-cart-products">
                        ${
                          this.productList.length > 0
                            ? `
                                <div class="header-cart-products-header">
                                    <span>Sản phẩm mới thêm</span>
                                </div>
                                <ul class="header-cart-products-list">
                                    ${this.productList.map((item) => {
                                      return `
                                        <li class="header-cart-products-item">
                                            <div class="header-cart-products-item-left">
                                                <img src="${originUrl}/img/${item.image}" alt="" class="header-cart-products-image">
                                                <span class="header-cart-products-name">${item.name}</span>
                                            </div>
                                            <span class="header-cart-products-price">${utils.formatMoney(item.price)} VNĐ</span>
                                        </li>`;
                                    }).join("")}
                                </ul>
                                <div class="header-cart-products-footer">
                                    <button class="btn btn-long btn-primary">Xem giỏ hàng</button>
                                </div>
                            `
                            : `
                            <div class="header-cart-products-text">Chưa có sản phẩm</div>
                        `
                        }
                    </div>
                </div>
            </a>
            <div class="header-authentication">
                ${
                  Object.keys(user).length !== 0
                    ? `
                    <div class="header-user">
                        <span class="header-user-name">${user.username}</span>
                        <img src="${originUrl}/img/${
                        user.avatar != "null" ? user.avatar : "ava001.jpg"
                      }" class="header-user-avatar"></img>
                        <ul class="header-user-list">
                            <li class="header-user-item">
                                <a href="${originUrl}/pages/account.html" class="header-user-link">Tài khoản của tôi</a> 
                            </li>
                            <li class="header-user-item">
                                <a href="${originUrl}/pages/history.html" class="header-user-link">Lịch sử mua hàng</a>
                            </li>
                            <li class="header-user-item">
                                <a href="${originUrl}/pages/login.html" class="header-user-link">Đăng xuất</a>
                            </li>
                        </ul>
                    </div>
                `
                    : `
                    <a href="${originUrl}/pages/register.html" class="btn btn-transparent header-register">Đăng ký</a>
                    <a href="${originUrl}/pages/login.html" class="btn btn-black header-login">Đăng nhập</a>
                `
                }
            </div>
        </div>
    `

    this.removeEvents();

    cartBtn = document.querySelector(".header-cart-products-footer button");

    this.handleEvents();
  },
  cartBtnHandler(e) {
    e.preventDefault();
    window.location.href = `${originUrl}/pages/cart.html`;
  },
  removeEvents() {
    if (cartBtn) {
      cartBtn.removeEventListener("click", this.cartBtnHandler);
    }
  },
  handleEvents() {
    if (cartBtn) {
      cartBtn.addEventListener("click", this.cartBtnHandler);
    }
  },
  init() {
    this.renderHtml();
  },
};

export default header;
