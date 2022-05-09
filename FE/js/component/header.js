const originUrl = `${window.origin}/FE`;

const product = {
  image: "pd001.jpg",
  name: "Catan US",
  price: "1.600.000 VNĐ",
};

let productList = [];

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

let user = getCookie("token")
  ? {
      username: getCookie("Username"),
      avatar: getCookie("Avatar"),
    }
  : {};

const header = {
  headerHtml: "",
  handleEvents() {
    const headerContainer = document.querySelector("header");
    headerContainer.onclick = (e) => {
      const cartProductBtn = e.target.closest(
        ".header-cart-products-footer button"
      );
      if (cartProductBtn) {
        e.preventDefault();
        window.location.href = `${originUrl}/pages/cart.html`;
      }
    };
  },
  init() {
    //   Create product List data
    for (let i = 0; i < 3; i++) productList.push(product);
    const html = productList
      .map((item) => {
        return `
            <li class="header-cart-products-item">
                <div class="header-cart-products-item-left">
                    <img src="${originUrl}/img/${item.image}" alt="" class="header-cart-products-image">
                    <span class="header-cart-products-name">${item.name}</span>
                </div>
                <span class="header-cart-products-price">${item.price}</span>
            </li>`;
      })
      .join("");

    // Add html to header
    this.headerHtml = `
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
            <a href="cart.html">
                <div class="header-cart">
                    <i class="fa-solid fa-cart-shopping"></i>
                    <div class="header-cart-products">
                        ${
                          productList.length > 0
                            ? `
                            <div class="header-cart-products-header">
                                <span>Sản phẩm mới thêm</span>
                            </div>
                            <ul class="header-cart-products-list">
                                ${html}
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
    `;
    this.handleEvents();
  },
};

export default header;
