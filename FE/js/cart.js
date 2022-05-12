import header from "./component/header.js";
import footer from "./component/footer.js";
import voucher from "./component/voucher.js"
import notifyModal from "./component/notifyModal.js";
import modal from "./utils/modal.js";
import utils from "./utils/utils.js"

const footerContainer = document.querySelector(".footer");

const productSelected = [];

let cartProductChecks;
let cartTotalCheck;
let cartProductDeletes;
let cartProductDeleteSelected;
let cartProductDecs;
let cartProductIncs;
let cartProductQuantitys;
let cartProductsVoucherBtn;
let cartPaymentBtn;

const product = {
  image: "pd001.jpg",
  name: "Catan US",
  //   price: 100,
  //   quantity: 1,
};

const productList = [];

for (let i = 0; i < 3; i++) {
  productList.push({
    id: i,
    price: Math.floor(Math.random() * (2000 - 1 + 1)) + 1,
    quantity: Math.floor(Math.random() * (10 - 1 + 1)) + 1,
    ...product,
  });
}

const app = {
  voucher: 0,
  price: {},
  renderHtml() {
    this.voucher = voucher.voucherSelected.value ? voucher.voucherSelected.value : 0;
    this.calculatePrice();
    document.querySelector(".cart").innerHTML = `
        <div class="cart-header border-b-solid">
            <span>Giỏ hàng</span>
        </div>
        <div class="cart-content">
        ${
          productList.length === 0
            ? `
            <div class="cart-empty">
                <img src="../img/cart001.png" alt="" class="cart-empty-image">
                <span>Giỏ hàng của bạn còn trống</span>
                <button class="btn btn-m-long btn-primary">Mua hàng</button>
            </div>        
        `
            : `
            <div class="cart-content-header">
                <span>Sản phẩm</span>
                <span>Đơn giá</span>
                <span>Số lượng</span>
                <span>Số tiền</span>
                <span>Thao tác</span>
            </div>
            <div class="cart-products">
                <ul class="cart-products-list">
                    ${productList
                      .map((item) => {
                        return `
                            <li class="cart-products-item" data-id="${item.id}">
                                <div class="cart-product-info">
                                    <div>
                                        <input class="cart-product-check" type="checkbox" ${
                                          productSelected.includes(item)
                                            ? "checked"
                                            : ""
                                        }>
                                    </div>
                                    <img src="../img/${
                                      item.image
                                    }" alt="" class="cart-product-image">
                                    <span class="cart-product-name">${
                                      item.name
                                    }</span>
                                </div>
                                <span class="cart-product-price">${
                                  utils.formatMoney(item.price)
                                } VNĐ</span>
                                <div class="cart-product-quantity">
                                    <div class="cart-product-quantity-dec">
                                        <span>-</span>
                                    </div>
                                    <input type="number" value="${
                                      item.quantity
                                    }" class="cart-product-quantity-number">
                                    <div class="cart-product-quantity-inc">
                                        <span>+</span>
                                    </div>
                                </div>
                                <span class="cart-product-price">${
                                  utils.formatMoney(item.price * item.quantity)
                                } VNĐ</span>
                                <div class="cart-product-action">
                                    <span class="cart-product-delete">Xóa</span>
                                </div>
                            </li>
                        `;
                      })
                      .join("")}
                </ul>
            </div>
            <div class="cart-products-footer">
                <div class="cart-products-voucher border-b-dashed">
                    <div class="cart-products-voucher-select">
                        <img src="../img/icon_voucher_small.png" alt="">
                        <span>Nhập mã Voucher</span>
                    </div>
                </div>
                <div class="cart-products-saving-container border-b-dashed">
                    <div class="cart-products-saving">
                      ${this.voucher ? `
                            <div class="cart-products-saving-voucher">-${
                              this.voucher
                            }%</div>
                            ` : ""}
                        <span>-${utils.formatMoney(this.price.savingPrice)} VNĐ</span>
                    </div>
                </div>
                <div class="cart-products-footer-action">
                    <div class="cart-products-footer-left">
                        <input type="checkbox" id="select-all" ${
                          productSelected.length === productList.length
                            ? "checked"
                            : ""
                        }>
                        <label for="select-all">Chọn tất cả</label>
                        <span class="delete-selected">Xóa</span>
                    </div>
                    <div class="cart-products-footer-right">
                        <div class="cart-products-total-price">
                            <div>
                                <span class="text-middle">Tổng thanh toán (${
                                  productSelected.length
                                } sản phẩm): </span>
                                <span class="text-small">Tiết kiệm</span>
                            </div>
                            <div>
                                <span class="text-middle"> ${
                                  utils.formatMoney(this.price.lastPrice)
                                } VNĐ</span>
                                <span class="text-small">${
                                  utils.formatMoney(this.price.savingPrice)
                                } VNĐ</span>
                            </div>
                        </div>
                        <a href="payment.html" class="btn btn-m-long btn-primary cart-payment-btn">Thanh toán</a>
                    </div>
                </div>
            </div>
        `
        }
        </div>
    `;

    this.removeEvents();

    cartProductChecks = document.querySelectorAll(".cart-product-check");
    cartTotalCheck = document.querySelector("#select-all");
    cartProductDeletes = document.querySelectorAll(".cart-product-delete");
    cartProductDeleteSelected = document.querySelector(".delete-selected");
    cartProductDecs = document.querySelectorAll(".cart-product-quantity-dec");
    cartProductIncs = document.querySelectorAll(".cart-product-quantity-inc");
    cartProductQuantitys = document.querySelectorAll(".cart-product-quantity-number");
    cartProductsVoucherBtn = document.querySelector(".cart-products-voucher-select");
    cartPaymentBtn = document.querySelector(".cart-payment-btn");

    this.handleEvents();
  },
  selectProduct(productItem) {
    productList.forEach((product) => {
      if (product.id == productItem.dataset.id) {
        if (!productSelected.includes(product)) {
          productSelected.push(product);
        }
      }
    });
  },
  deleteProduct(productItem) {
    productList.forEach((product) => {
      if (product.id == productItem.dataset.id) {
        const index = productSelected.indexOf(product);
        if (index != -1) productSelected.splice(index, 1);
      }
    });
  },
  calculatePrice() {
    let totalPrice = 0;
    productSelected.forEach((item) => {
      totalPrice += item.price * item.quantity;
    });
    this.price = {
      totalPrice: totalPrice,
      savingPrice: Math.floor((totalPrice * this.voucher) / 100),
      lastPrice: Math.floor(totalPrice * (1 - this.voucher / 100)),
    };
  },
  cartTotalHandler() {
    cartProductChecks.forEach((cartProductCheck) => {
      const productItem = cartProductCheck.closest(".cart-products-item");
      if (cartTotalCheck.checked) {
        app.selectProduct(productItem);
      } else {
        app.deleteProduct(productItem);
      }
    });
    app.renderHtml();
  },
  productCheckHandler(e) {
    const productItem = e.target.closest(".cart-products-item");
    if (!e.target.checked) {
      app.deleteProduct(productItem);
    } else {
      app.selectProduct(productItem);
    }
    app.renderHtml();
  },
  productDeleteHandler(e) {
    productList.forEach((product) => {
      const productItem = e.target.closest(".cart-products-item");
      if (product.id == productItem.dataset.id) {
        const index = productList.indexOf(product);
        const index2 = productSelected.indexOf(product);
        if (index != -1) productList.splice(index, 1);
        if (index2 != -1) productSelected.splice(index2, 1);

        // Call delete cart item API

        // Set cart session
        window.sessionStorage.cart = JSON.stringify(productList);
      }
    });
    header.renderHtml();
    app.renderHtml();
  },
  productDeleteSelectedHandler() {
    productSelected.forEach((product) => {
      const index = productList.indexOf(product);
      if (index != -1) productList.splice(index, 1);
    });
    productSelected.splice(0, productSelected.length);
    app.renderHtml();
  },
  productDecHandler(e) {
    const productItem = e.target.closest(".cart-products-item");
    productList.forEach((product) => {
      if (product.id == productItem.dataset.id) {
        const index = productList.indexOf(product);
        if (index != -1) {
          if (productList[index].quantity > 1) {
            productList[index].quantity--;
            return;
          }
        }
      }
    });
    app.renderHtml();
  },
  productIncHandler(e) {
    const productItem = e.target.closest(".cart-products-item");
    productList.forEach((product) => {
      if (product.id == productItem.dataset.id) {
        const index = productList.indexOf(product);
        if (index != -1) productList[index].quantity++;
      }
    });
    app.renderHtml();
  },
  productQuantityHandler(e) {
    console.log(e.target.value)
    if (!e.target.value || e.target.value < 1) {
      e.target.value = 1;
    }
    const productItem = e.target.closest(".cart-products-item");
    productList.forEach((product) => {
      if (product.id == productItem.dataset.id) {
        const index = productList.indexOf(product);
        if (index != -1) productList[index].quantity = e.target.value;
      }
    });
    app.renderHtml();
  },
  cartVoucherBtnHandler(e) {
    if (document.querySelector(".voucher")) {
      const modals = Array.from(document.querySelectorAll(".modal"));
      const voucherModal = document
        .querySelector(".modal .voucher")
        .closest(".modal");
      const index = modals.indexOf(voucherModal);
      modal.showModal(index);
    } else {
      const modalHtml = `
        <div class="modal active">
        <div class="modal-overlay"></div>
          <div class="modal-body">
            <div class="voucher"></div>
          </div>
        </div>
      `;
      document.querySelector("body").innerHTML += modalHtml;
      voucher.init();
    }
    app.renderHtml();
  },
  cartPaymentHandler (e) {
    if (productSelected.length === 0) {
      e.preventDefault();
      notifyModal.init("Bạn chưa chọn sản phẩm nào để mua", 1);
      notifyModal.showModal();
      app.renderHtml();
    } else {
      e.preventDefault();
      window.sessionStorage.cartSelected = JSON.stringify({
        productList: productSelected,
        voucher: app.voucher,
        price: app.price,
        quantity: productSelected.length
      })
      window.location.href = `${window.location.origin}/FE/pages/payment.html`;
    }
  },
  removeEvents() {
    if (cartTotalCheck)
      cartTotalCheck.removeEventListener("change", this.cartTotalHandler);
    if (cartProductChecks) {
      cartProductChecks.forEach((cartProductCheck) => {
        cartProductCheck.removeEventListener(
          "change",
          this.productCheckHandler
        );
      });
    }
    if (cartProductDeletes) {
      cartProductDeletes.forEach((cartProductDelete) => {
        cartProductDelete.removeEventListener(
          "click",
          this.productDeleteHandler
        );
      });
    }
    if (cartProductDeleteSelected) {
      cartProductDeleteSelected.removeEventListener(
        "click",
        this.productDeleteSelectedHandler
      );
    }
    if (cartProductDecs) {
      cartProductDecs.forEach((cartProductDec) => {
        cartProductDec.removeEventListener("click", this.productDecHandler);
      });
    }
    if (cartProductIncs) {
      cartProductIncs.forEach((cartProductInc) => {
        cartProductInc.removeEventListener("click", this.productIncHandler);
      });
    }
    if (cartProductQuantitys) {
      cartProductQuantitys.forEach(cartProductQuantity => 
        cartProductQuantity.removeEventListener("change", this.productQuantityHandler)
      )
    }
    if (cartProductsVoucherBtn) {
      cartProductsVoucherBtn.removeEventListener(
        "click",
        this.cartVoucherBtnHandler
      );
    }
    if (cartPaymentBtn) {
      cartPaymentBtn.removeEventListener("click", this.cartPaymentHandler);
    }
  },
  handleEvents() {
    if (cartTotalCheck) {
      cartTotalCheck.addEventListener("change", this.cartTotalHandler);
    }
    if (cartProductChecks) {
      cartProductChecks.forEach((cartProductCheck) => {
        cartProductCheck.addEventListener("change", this.productCheckHandler);
      });
    }
    if (cartProductDeletes) {
      cartProductDeletes.forEach((cartProductDelete) => {
        cartProductDelete.addEventListener("click", this.productDeleteHandler);
      });
    }
    if (cartProductDeleteSelected) {
      cartProductDeleteSelected.addEventListener(
        "click",
        this.productDeleteSelectedHandler
      );
    }
    if (cartProductDecs) {
      cartProductDecs.forEach((cartProductDec) => {
        cartProductDec.addEventListener("click", this.productDecHandler);
      });
    }
    if (cartProductIncs) {
      cartProductIncs.forEach((cartProductInc) => {
        cartProductInc.addEventListener("click", this.productIncHandler);
      });
    }
    if (cartProductQuantitys) {
      cartProductQuantitys.forEach(cartProductQuantity =>
        cartProductQuantity.addEventListener("change", this.productQuantityHandler)
      )
    }
    if (cartProductsVoucherBtn) {
      cartProductsVoucherBtn.addEventListener("click", this.cartVoucherBtnHandler);
    }
    if(cartPaymentBtn) {
      cartPaymentBtn.addEventListener("click", this.cartPaymentHandler);
    }
  },
  init() {
    footerContainer.innerHTML = footer;
    this.renderHtml();
    window.sessionStorage.cart = JSON.stringify(productList);
    header.init();
  },
};

export default app;
