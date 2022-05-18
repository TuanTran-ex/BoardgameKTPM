import header from "./component/header.js";
import footer from "./component/footer.js";
import address from "./component/address.js";
import modal from "./utils/modal.js";
import utils from "./utils/utils.js"

const footerContainer = document.querySelector(".footer");

let cartAddressChange;
let cartAddressCloseBtn;
let cartAddressApplyBtn;
let cartAddressDefaultBtns;
let cartAddressChecks;
let cartAddressDeleteBtns;
let cartAddressUpdateBtns;
let cartAddressNewBtn;
let cartOrderBtn;

// const user = {
//     address: [
//         {
//             id: 0,
//             name: "Ricasdo Công Đạt  Công Đạt Công Đạt Công Đạt Công Đạt",
//             phone: "(+84) 0123456789",
//             address: "72 Phạm Văn Đồng",
//             isDefault: true,
//         },
//         {
//             id: 1,
//             name: "Ricasdo ",
//             phone: "(+84) 01234522289",
//             address: "72 Phạm Văn Đồng, Phường Vỹ Dạ, Tp Huế, Thừa Thiên Huế",
//             isDefault: false
//         },
//         {
//             id: 2,
//             name: "Ricasdo Đạt",
//             phone: "(+84) 0121236789",
//             address: "72 Phạm Văn Đồng, Thừa Thiên Huế",
//             isDefault: false
//         }
//     ]
// };

let addressList = [];

let cart;

const date = new Date();
const beginDate = new Date();
const endDate = new Date();
beginDate.setDate(date.getDate() + 10);
endDate.setDate(date.getDate() + 15);

const app = {
    addressChange: false,
    addressSelected: {},
    renderHtml() {
        document.querySelector(".cart").innerHTML = `
            <div class="cart-header border-b-solid">
                <span>Thanh toán</span>
            </div>
            <div class="cart-address">
                <div class="cart-address-header border-b-dashed">
                    <div>
                        <i class="fa-solid fa-location-dot"></i>
                        <span>Địa chỉ nhận hàng</span>
                    </div>
                ${this.addressChange ? `
                    <button class="btn btn-long btn-white cart-address-new">
                        <i class="fa-solid fa-plus"></i>
                        Thêm địa chỉ mới
                    </button> 
                ` : ``}
                </div>
                <div class="cart-address-content">
                    ${this.addressChange ? `
                        <ul class="cart-address-list">
                            ${addressList.map(item => {
                                return `
                                    <li class="cart-address-item" data-id="${item.id}">
                                        <div class="cart-address-info">
                                            <input type="checkbox" class="cart-address-check" ${item.id == this.addressSelected.id ? "checked" : ""}>
                                            <div>
                                                <span class="cart-address-name">${item.name}</span>
                                                <span>(+84) ${item.phone}</span>
                                            </div>
                                            <span class="cart-address-address">${item.address}</span>
                                        </div>
                                        <div class="cart-address-action">
                                            ${item.isDefault ? `
                                                <span>Mặc định</span>
                                            ` : `
                                                <span class="primary-text cart-address-default-btn">Đặt làm mặc định</span>
                                            `}
                                            <span class="cart-address-update">Sửa</span>
                                            <span class="cart-address-delete">Xóa</span>
                                        </div>
                                    </li>
                                `
                            }).join("")}
                        </ul>
                        <div class="cart-address-content-footer">
                            <button class="btn btn-white btn-long cart-address-close">Trở lại</button>
                            <button class="btn btn-primary btn-long cart-address-apply">Hoàn thành</button>
                        </div>  
                        ` : `
                            <ul class="cart-address-list">
                                <li class="cart-address-item">
                                    ${Object.keys(this.addressSelected).length !== 0 ? `
                                        <div class="cart-address-info">
                                            <div>
                                                <span class="cart-address-name">${this.addressSelected.name}</span>
                                                <span>(+84) ${this.addressSelected.phone}</span>
                                            </div>
                                            <span class="cart-address-address">${this.addressSelected.address}</span>
                                        </div>
                                    ` : `
                                        <span>Không có</span>
                                    `}
                                    <div class="cart-address-action">
                                        ${this.addressSelected.isDefault ? `
                                            <span>Mặc định</span>
                                        ` : ""}
                                        <span class="text-primary cart-address-change">Thay đổi</span>
                                    </div>
                                </li>
                            </ul> 
                        `}
                </div>
            </div>
            <div class="cart-content payment">
                <div class="cart-content-header">
                    <span>Sản phẩm</span>
                    <span>Đơn giá</span>
                    <span>Số lượng</span>
                    <span>Số tiền</span>
                </div>
                <div class="cart-products">
                    <ul class="cart-products-list">
                        ${cart.productList.map(item => {
                            return `
                                <li class="cart-products-item">
                                    <div class="cart-product-info">
                                        <img src="${item.MainImage}" alt="" class="cart-product-image">
                                        <span class="cart-product-name">${item.Name}</span>
                                    </div>
                                    <span class="cart-product-price">${utils.formatMoney(item.Price)} VNĐ</span>
                                    <span class="cart-product-quantity">${item.Amount}</span>
                                    <span class="cart-product-price">${utils.formatMoney(item.Price * item.Amount)} VNĐ</span>
                                </li>
                            `
                        }).join("")}
                    </ul>
                </div>
                <div class="cart-products-footer">
                    <div class="cart-products-footer-note border-b-dashed">
                        <span>Hình thức thanh toán</span>
                        <div>
                            <span>Thanh toán khi nhận hàng</span>
                            <span>Nhận hàng ngày ${utils.getFormattedDate(beginDate)} - ${utils.getFormattedDate(endDate)}</span>
                        </div>
                    </div>
                    <div class="cart-products-footer-money border-b-dashed">
                        <div>
                            <div>
                                <span>Tổng tiền hàng:</span>
                            </div>
                            <div>
                                <span>${utils.formatMoney(cart.price.totalPrice)} VNĐ</span>
                            </div>
                            <div>
                                <span>Voucher:</span>
                            </div>
                            <div>
                                <div class="cart-products-saving-voucher">-${cart.voucher}%</div>
                            </div>
                            <div>
                                <span>Phí vận chuyển:</span>
                            </div>
                            <div>
                                <span>33.000 VNĐ</span>
                            </div>
                            <div>
                                <span>Tổng thanh toán (${cart.quantity} sản phẩm):</span>
                            </div>
                            <div>
                                <span class="primary-text text-middle">${utils.formatMoney(cart.price.lastPrice + 33000)} VNĐ</span>
                            </div>
                        </div>
                    </div>
                    <div class="cart-products-footer-action">
                        <button class="btn btn-m-long btn-primary cart-order-btn">Đặt hàng</button>
                    </div>
                </div>
            </div>
        `
        
        this.removeEvents();

        cartAddressChange = document.querySelector(".cart-address-change");
        cartAddressCloseBtn = document.querySelector(".cart-address-close");
        cartAddressApplyBtn = document.querySelector(".cart-address-apply");
        cartAddressDefaultBtns = document.querySelectorAll(".cart-address-default-btn");
        cartAddressChecks = document.querySelectorAll(".cart-address-check");
        cartAddressDeleteBtns = document.querySelectorAll(".cart-address-delete");
        cartAddressUpdateBtns = document.querySelectorAll(".cart-address-update");
        cartAddressNewBtn = document.querySelector(".cart-address-new");
        cartOrderBtn = document.querySelector(".cart-order-btn");

        this.handleEvents();
    },
    cartAddressChangeBtnHandler() {
        app.addressChange = true;
        app.renderHtml();
    },
    cartAddressCloseHandler() {
        app.addressChange = false;
        app.renderHtml();  
    },
    cartAddressApplyHandler() {
        app.addressChange = false;
        app.renderHtml();
    },
    cartAddressCheckHandler(e) {
        const addressItem = e.target.closest(".cart-address-item");
        addressList.forEach(item => {
            if (item.id == addressItem.dataset.id) {
                app.addressSelected = {...item};
            }
        })
        app.renderHtml();
    },
    cartAddressDefaultBtnHandler(e) {
        // Call address update API

        const addressItem = e.target.closest(".cart-address-item");
        addressList.forEach((item, index) => {
            if (item.isDefault == true)
                addressList[index].isDefault = false;
            if (item.id == addressItem.dataset.id)
                addressList[index].isDefault = true;
            })
        if (Object.keys(app.addressSelected).length !== 0) {
            if (addressItem.dataset.id == app.addressSelected.id)
                app.addressSelected.isDefault = true;
            else 
                app.addressSelected.isDefault = false;
        }
        app.renderHtml();
    },
    cartAddressDeleteHandler(e) {
        // Call address delete API

        const addressItem = e.target.closest(".cart-address-item");
        addressList = [...addressList.filter(item => item.id != addressItem.dataset.id)];
        if (addressItem.dataset.id == app.addressSelected.id) {
            app.addressSelected = {};
        }
        app.renderHtml();
    },
    cartAddressUpdateHandler(e) {
        const addressItem = e.target.closest(".cart-address-item");
        const item = addressList.find(item => item.id == addressItem.id);
        if (document.querySelector(".address")) {
            const modals = Array.from(document.querySelectorAll(".modal"));
            const addressModal = document.querySelector(".modal .address").closest(".modal");
            const index = modals.indexOf(addressModal);
            modal.showModal(index);
        } else {
            const modalHtml = `
                <div class="modal active">
                <div class="modal-overlay"></div>
                <div class="modal-body">
                    <div class="address"></div>
                </div>
                </div>
            `;
            document.querySelector("body").innerHTML += modalHtml;
        }
        address.init(item.id, item.name, item.phone, item.address, item.isDefault);
        app.renderHtml();
    },
    cartAddressNewHandler() {
        if (document.querySelector(".address")) {
            const modals = Array.from(document.querySelectorAll(".modal"));
            const addressModal = document.querySelector(".modal .address").closest(".modal");
            const index = modals.indexOf(addressModal);
            modal.showModal(index);
        } else {
            const modalHtml = `
                <div class="modal active">
                <div class="modal-overlay"></div>
                <div class="modal-body">
                    <div class="address"></div>
                </div>
                </div>
            `;
            document.querySelector("body").innerHTML += modalHtml;
        }
        address.init();
        app.renderHtml();
    },
    cartOrderHandler() {
        if (Object.keys(app.addressSelected).length !== 0) {
            // Call Create Order API
    
            window.location.href = `${window.location.origin}/FE/index.html`;
        } else {
            if (document.querySelector(".notification")) {
                const modals = Array.from(document.querySelectorAll(".modal"));
                const notifyModal = document.querySelector(".modal .notification").closest(".modal");
                const index = modals.indexOf(notifyModal);
                modal.showModal(index);
            } else {
                const modalHtml = `
                <div class="modal active">
                <div class="modal-overlay"></div>
                    <div class="modal-body">
                    <div class="notification">
                        <span>Vui lòng chọn địa chỉ nhận hàng</span>
                    </div>
                    </div>
                </div>
                `;
                document.querySelector("body").innerHTML += modalHtml;
            }
            if (document.querySelector(".address")) {
                address.init();
            }
            else {
                modal.init();
            }
      app.renderHtml();
        }
    },
    removeEvents() {
        if (cartAddressChange) {
            cartAddressChange.removeEventListener("click", this.cartAddressChangeBtnHandler);
        }
        if (cartAddressCloseBtn) {
            cartAddressCloseBtn.removeEventListener("click", this.cartAddressCloseHandler);
        }
        if (cartAddressApplyBtn) {
            cartAddressApplyBtn.removeEventListener("click", this.cartAddressApplyHandler);
        }
        if (cartAddressDefaultBtns) {
            cartAddressDefaultBtns.forEach(cartAddressDefaultBtn => {
                cartAddressDefaultBtn.removeEventListener("click", this.cartAddressDefaultBtnHandler);
            })
        }
        if (cartAddressChecks) {
            cartAddressChecks.forEach(cartAddressCheck => {
                cartAddressCheck.removeEventListener("click", this.cartAddressCheckHandler);
            })
        }
        if (cartAddressDeleteBtns) {
            cartAddressDeleteBtns.forEach(cartAddressDeleteBtns => {
                cartAddressDeleteBtns.removeEventListener("click", this.cartAddressDeleteHandler);
            })
        }
        if (cartAddressUpdateBtns) {
            cartAddressUpdateBtns.forEach(cartAddressUpdateBtns => {
                cartAddressUpdateBtns.removeEventListener("click", this.cartAddressUpdateHandler);
            })
        }
        if (cartAddressNewBtn) {
            cartAddressNewBtn.removeEventListener("click", this.cartAddressNewHandler);
        }
        if (cartOrderBtn) {
            cartOrderBtn.removeEventListener("click", this.cartOrderHandler);
        }
    },
    handleEvents() {
        if (cartAddressChange) {
            cartAddressChange.addEventListener("click", this.cartAddressChangeBtnHandler);
        }
        if (cartAddressCloseBtn) {
            cartAddressCloseBtn.addEventListener("click", this.cartAddressCloseHandler);
        }
        if (cartAddressApplyBtn) {
            cartAddressApplyBtn.addEventListener("click", this.cartAddressApplyHandler);
        }
        if (cartAddressDefaultBtns) {
            cartAddressDefaultBtns.forEach(cartAddressDefaultBtn => {
                cartAddressDefaultBtn.addEventListener("click", this.cartAddressDefaultBtnHandler);
            })
        }
        if (cartAddressChecks) {
            cartAddressChecks.forEach(cartAddressCheck => {
                cartAddressCheck.addEventListener("click", this.cartAddressCheckHandler);
            })
        }
        if (cartAddressDeleteBtns) {
            cartAddressDeleteBtns.forEach(cartAddressDeleteBtns => {
                cartAddressDeleteBtns.addEventListener("click", this.cartAddressDeleteHandler);
            })
        }
        if (cartAddressUpdateBtns) {
            cartAddressUpdateBtns.forEach(cartAddressUpdateBtns => {
                cartAddressUpdateBtns.addEventListener("click", this.cartAddressUpdateHandler);
            })
        }
        if (cartAddressNewBtn) {
            cartAddressNewBtn.addEventListener("click", this.cartAddressNewHandler);
        }
        if (cartOrderBtn) {
            cartOrderBtn.addEventListener("click", this.cartOrderHandler);
        }
    },
    init() {
        if (utils.getCookie("token")) {
            cart = utils.getSession("cartSelected");
            header.init();
            footerContainer.innerHTML = footer;

            // Call get address list API
            addressList = [
                {
                    id: 0,
                    name: "Ricasdo Công Đạt  Công Đạt Công Đạt Công Đạt Công Đạt",
                    phone: "0123456789",
                    address: "72 Phạm Văn Đồng, Phường Vỹ Dạ, Thành phố Huế, Tỉnh Thừa Thiên Huế",
                    isDefault: true,
                },
                {
                    id: 1,
                    name: "Ricasdo ",
                    phone: "01234522289",
                    address: "72 Phạm Văn Đồng, Phường Phú Thuận, Thành phố Huế, Tỉnh Thừa Thiên Huế",
                    isDefault: false
                },
                {
                    id: 2,
                    name: "Ricasdo Đạt",
                    phone: "0121236789",
                    address: "72 Phạm Văn Đồng, Phường Vỹ Dạ, Thành phố Huế, Tỉnh Thừa Thiên Huế",
                    isDefault: false
                }
            ]
            this.addressSelected = addressList.find(item => item.isDefault = true);
            this.renderHtml();
        } else {
            window.location.href = `${window.location.origin}/FE/pages/login.html`
        }
    },
};

export default app;
