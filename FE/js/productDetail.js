import header from "./component/header.js";
import footer from "./component/footer.js";
import notifyModal from "./component/notifyModal.js";
import slider from "./utils/slider.js";
import utils from "./utils/utils.js";

const footerContainer = document.querySelector(".footer");

const productId = new URL(window.location.href).searchParams.get("product-id");

const product = {
    name: "Mèo nổ",
    price: 90000,
    mainImage: "pd001.jpg",
    images: [
        {
            id: 0,
            path: "pd001.jpg",
        },
        {
            id: 1,
            path: "pd002.png",
        },
        {
            id: 2,
            path: "pd003.png",
        },
        {
            id: 3,
            path: "pd004.png",
        },
        {
            id: 4,
            path: "pd001.png",
        },
        {
            id: 5,
            path: "pd002.png",
        }
    ],
    players: "2-5 người",
    time: "15 phút",
    age: "6-14 tuổi",
    categories: [
        {
            id: 0,
            name: "Gia đình"
        },
        {
            id: 1,
            name: "Chiến thuật"
        },
        {
            id: 1,
            name: "Chiến thuật"
        },
        {
            id: 1,
            name: "Chiến thuật"
        },
        {
            id: 1,
            name: "Chiến thuật"
        }
    ],
    description: ""
}

const feedbacks = [
    {
        id: 0,
        user: {
            avatar: null,
            username: "BoardgameKTPM",
        },
        rate: 1,
        date: "25/05/2022",
        comment: "Game rất vui, hấp dẫn nên vote 1 sao",
        images: [
            {
                id: 0,
                path: "pd001.jpg"
            },
            {
                id: 1,
                path: "ava001.jpg"
            }
        ]
    },
    {
        id: 1,
        user: {
            avatar: "ava001.jpg",
            username: "BoardgameKTPM",
        },
        rate: 1,
        date: "25/05/2022",
        comment: "Game rất vui, hấp dẫn nên vote 1 sao",
        images: [
            {
                id: 0,
                path: "ava001.jpg"
            },
            {
                id: 1,
                path: "ava001.jpg"
            }
        ]
    },
    {
        id: 2,
        user: {
            avatar: "ava001.jpg",
            username: "BoardgameKTPM",
        },
        rate: 1,
        date: "25/05/2022",
        comment: "Game rất vui, hấp dẫn nên vote 1 sao",
        images: [
            {
                id: 0,
                path: "ava001.jpg"
            },
            {
                id: 1,
                path: "ava001.jpg"
            }
        ]
    }
]

let cartAddBtn;
let cartPageBtn;
let cartProductDec;
let cartProductInc;
let cartProductQuantity;

const app = {
    product: {},
    renderHtml() {
        document.querySelector(".product-detail").innerHTML = `
            <div class="product-detail-header border-b-solid">
                <span>Sản phẩm</span>
                <span class="product-detail-header-name">// ${product.name}</span>
            </div>
            <div class="product-info">
                <div class="product-image">
                    <div class="slider slider-main n-btn">
                        <div class="slider-row">
                            <ul class="slider-list" data-col="1" data-gap="1rem">
                            ${product.images.map(image => {
                                return `
                                    <li class="slider-item">
                                        <img class="slider-img" src="../img/${image.path}" alt="">
                                    </li>
                                `
                            }).join("")}
                            </ul>
                        </div>
                    </div>
                    <div class="slider slider-sub">
                        <div class="slider-row">
                            <ul class="slider-list" data-col="4" data-gap="1.7rem">
                                ${product.images.map(image => {
                                    return `
                                        <li class="slider-item">
                                            <img class="slider-img" src="../img/${image.path}" alt="">
                                        </li>
                                    `
                                }).join("")}
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="product-info-content">
                    <span class="product-name">${product.name}</span>
                    <div class="product-group product-price">
                        <span class="product-label">Giá:</span>
                        <span class="primary-text text-m-large">${utils.formatMoney(product.price)} VNĐ</span>
                    </div>
                    <div class="product-group">
                        <span class="product-label">Số người chơi:</span>
                        <span>${product.players}</span>
                    </div>
                    <div class="product-group">
                        <span class="product-label">Thời gian:</span>
                        <span>${product.time}</span>
                    </div>
                    <div class="product-group">
                        <span class="product-label">Độ tuổi:</span>
                        <span>${product.age}</span>
                    </div>
                    <div class="product-group">
                        <span class="product-label">Thể loại:</span>
                        <ul class="product-tag-list">
                            ${product.categories.map(category => {
                                return `
                                    <li class="product-tag-item">
                                        <span>${category.name}</span>
                                    </li>
                                `
                            }).join("")}    
                        </ul>
                    </div>
                    <div class="product-group">
                        <span class="product-label">Số lượng:</span>
                        <div class="product-quantity">
                            <div class="product-quantity-dec">
                                <span>-</span>
                            </div>
                            <input type="number" value="${this.product.quantity}" class="product-quantity-number">
                            <div class="product-quantity-inc">
                                <span>+</span>
                            </div>
                        </div>
                    </div>
                    <div class="product-group product-footer">
                        <button class="btn btn-sub-primary cart-add-btn">Thêm vào giỏ hàng</button>
                        <button class="btn btn-primary btn-m-long cart-page-btn">Mua ngay</button>
                    </div>
                </div>
            </div>
            <div class="product-description">
                <span class="product-description-header">Mô tả sản phẩm</span>
                <div class="product-description-content">${product.description}</div>
            </div>
            <div class="product-feedback">
                <div class="product-feedback-header border-b-dashed">
                    <span>Đánh giá sản phẩm</span>
                </div>
                <ul class="product-feedback-list">
                    ${feedbacks.map(feedback => {
                        return `
                            <li class="product-feedback-item">
                                <img src="../img/${feedback.user.avatar ? feedback.user.avatar : "ava001.jpg"}" alt="" class="product-feedback-avatar">
                                <div class="product-feedback-info">
                                    <div class="product-feedback-info-top">
                                        <span class="product-feedback-name">${feedback.user.username}</span>
                                        <div class="product-feedback-rate">
                                            <i class="product-feedback-rate-icon ${feedback.rate >= 1 ? `active fa-solid fa-star` : `fa-regular fa-star`}"></i>
                                            <i class="product-feedback-rate-icon ${feedback.rate >= 2 ? `active fa-solid fa-star` : `fa-regular fa-star`}"></i>
                                            <i class="product-feedback-rate-icon ${feedback.rate >= 3 ? `active fa-solid fa-star` : `fa-regular fa-star`}"></i>
                                            <i class="product-feedback-rate-icon ${feedback.rate >= 4 ? `active fa-solid fa-star` : `fa-regular fa-star`}"></i>
                                            <i class="product-feedback-rate-icon ${feedback.rate >= 5 ? `active fa-solid fa-star` : `fa-regular fa-star`}"></i>
                                        </div>
                                        <span class="product-feedback-date">${feedback.date}</span>
                                    </div>
                                    <div class="product-feedback-info-bottom">
                                        <span>${feedback.comment}</span>
                                    </div>
                                    <ul class="product-feedback-image-list">
                                        ${feedback.images.map(image => {
                                            return `
                                                <li class="product-feedback-image-item">
                                                    <img src="../img/${image.path}" class="product-feedback-image">
                                                </li>
                                            `
                                        }).join("")}
                                    </ul>
                                </div>
                            </li>
                        `
                    }).join("")}
                </ul>
            </div>
        `
        slider.init();

        this.removeEvents();

        cartAddBtn = document.querySelector(".cart-add-btn");
        cartPageBtn = document.querySelector(".cart-page-btn");
        cartProductDec = document.querySelector(".product-quantity-dec");
        cartProductInc = document.querySelector(".product-quantity-inc");
        cartProductQuantity = document.querySelector(".product-quantity-number");

        this.handleEvents();
    },
    cartProductDecHandler() {
        if (app.product.quantity > 1) {
            app.product.quantity--;
            app.renderHtml();
        }
    },
    cartProductIncHandler() {
        app.product.quantity++;
        app.renderHtml();
    },
    cartProductQuantityHandler(e) {
        if (!e.target.value || e.target.value < 1) {
            e.target.value = 1;
        }
        app.product.quantity = e.target.value;
        app.renderHtml();
    },
    cartAddHandler() {
        // Call Update cart API

        const cart = JSON.parse(window.sessionStorage.cart);
        const productItem = cart.find(item => item.id == app.product.id);
        if (productItem) {
            const index = cart.indexOf(productItem);
            cart[index].quantity += app.product.quantity;
        } else {
            cart.push(app.product);
        }
        window.sessionStorage.cart = JSON.stringify(cart);
        notifyModal.init("Thêm vào giỏ hàng thành công");
        notifyModal.showModal();
        
        app.renderHtml();
        header.renderHtml();

    },
    cartPageHandler() {
        // Call Update cart API

        const cart = JSON.parse(window.sessionStorage.cart);
        const productItem = cart.find(item => item.id == app.product.id);
        if (productItem) {
            const index = cart.indexOf(productItem);
            cart[index].quantity += app.product.quantity;
        } else {
            cart.push(app.product);
        }
        window.sessionStorage.cart = JSON.stringify(cart);
        window.location.href = `${window.location.origin}/FE/pages/cart.html`;
    },
    removeEvents() {
        if(cartProductDec) {
            cartProductDec.removeEventListener("click", this.cartProductDecHandler);
        }
        if(cartProductInc) {
            cartProductInc.removeEventListener("click", this.cartProductIncHandler);
        }
        if(cartProductQuantity) {
            cartProductQuantity.removeEventListener("change", this.cartProductQuantityHandler);
        }
        if(cartAddBtn) {
            cartAddBtn.removeEventListener("click", this.cartAddHandler);
        }
        if(cartPageBtn) {
            cartPageBtn.removeEventListener("click", this.cartPageHandler);
        }
    },
    handleEvents() {
        if(cartProductDec) {
            cartProductDec.addEventListener("click", this.cartProductDecHandler);
        }
        if(cartProductInc) {
            cartProductInc.addEventListener("click", this.cartProductIncHandler);
        }
        if(cartProductQuantity) {
            cartProductQuantity.addEventListener("change", this.cartProductQuantityHandler);
        }
        if(cartAddBtn) {
            cartAddBtn.addEventListener("click", this.cartAddHandler);
        }
        if(cartPageBtn) {
            cartPageBtn.addEventListener("click", this.cartPageHandler);
        }
    },
    init() {
        this.product = {
            id: productId,
            name: product.name,
            price: product.price,
            image: product.mainImage,
            quantity: 1,
        }
        header.init();
        footerContainer.innerHTML = footer;
        this.renderHtml();
    },
};

export default app;
