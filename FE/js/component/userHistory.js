import utils from "../utils/utils.js"
import confirmModal from "./confirmModal.js"
import feedback from "./feedback.js"
import userHeader from "./userHeader.js"

const order = {
    id: 0,
        date: "25/02/2022",
        dateGet: "3/02/2022",
        status: {
            id: 0,
            name: "Chờ xác nhận"
        },
        products: [
            {
                id: 0,
                image: "pd001.jpg",
                name: "Catan US",
                quantity: 1,
                price: 90000
            },
            {
                id: 1,
                image: "pd001.jpg",
                name: "Thám tử lừng danh Conan - Hồi kết",
                quantity: 3,
                price: 300000
            },
            {
                id: 2,
                image: "pd001.jpg",
                name: "Catan US",
                quantity: 2,
                price: 90000
            },
            {
                id: 3,
                image: "pd001.jpg",
                name: "Catan US",
                quantity: 10,
                price: 12878
            },
        ],
        voucher: 10
}

// Order code
//  0: Chưa xác nhận
//  1: Xác nhận
//  2: Hoàn thành
//  3: Hủy

let statusBtns;
let cancleBtns;
let feedbackBtns;

const userHistory = {
    orders: [
    {
        id: 2,
        date: "25/02/2022",
        dateGet: "3/02/2022",
        status: {
            id: 2,
            name: "Hoàn thành"
        },
        products: [
            {
                id: 0,
                image: "pd001.jpg",
                name: "Catan US",
                quantity: 1,
                price: 90000
            },
            {
                id: 1,
                image: "pd001.jpg",
                name: "Thám tử lừng danh Conan - Hồi kết",
                quantity: 3,
                price: 300000
            },
            {
                id: 2,
                image: "pd001.jpg",
                name: "Catan US",
                quantity: 2,
                price: 90000
            },
            {
                id: 3,
                image: "pd001.jpg",
                name: "Catan US",
                quantity: 10,
                price: 12878
            },
        ],
        voucher: 38,
        feedbacked: false
    },
    {
        id: 0,
        date: "25/02/2022",
        dateGet: "3/02/2022",
        status: {
            id: 0,
            name: "Chờ xác nhận"
        },
        products: [
            {
                id: 0,
                image: "pd001.jpg",
                name: "Catan US",
                quantity: 1,
                price: 90000
            },
            {
                id: 1,
                image: "pd001.jpg",
                name: "Thám tử lừng danh Conan - Hồi kết",
                quantity: 3,
                price: 300000
            },
            {
                id: 2,
                image: "pd001.jpg",
                name: "Catan US",
                quantity: 2,
                price: 90000
            },
            {
                id: 3,
                image: "pd001.jpg",
                name: "Catan US",
                quantity: 10,
                price: 12878
            },
        ],
        voucher: 10,
        feedbacked: false
    },
    {
        id: 1,
        date: "25/02/2022",
        dateGet: "3/02/2022",
        status: {
            id: 1,
            name: "Xác nhận"
        },
        products: [
            {
                id: 0,
                image: "pd001.jpg",
                name: "Catan US",
                quantity: 1,
                price: 90000
            },
            {
                id: 1,
                image: "pd001.jpg",
                name: "Thám tử lừng danh Conan - Hồi kết",
                quantity: 3,
                price: 300000
            },
            {
                id: 2,
                image: "pd001.jpg",
                name: "Catan US",
                quantity: 2,
                price: 90000
            },
            {
                id: 3,
                image: "pd001.jpg",
                name: "Catan US",
                quantity: 10,
                price: 12878
            },
        ],
        voucher: 99,
        feedbacked: false
    },
    {
        id: 3,
        date: "25/02/2022",
        dateGet: "3/02/2022",
        status: {
            id: 3,
            name: "Hủy"
        },
        products: [
            {
                id: 0,
                image: "pd001.jpg",
                name: "Catan US",
                quantity: 1,
                price: 90000
            },
            {
                id: 1,
                image: "pd001.jpg",
                name: "Thám tử lừng danh Conan - Hồi kết",
                quantity: 3,
                price: 300000
            },
            {
                id: 2,
                image: "pd001.jpg",
                name: "Catan US",
                quantity: 2,
                price: 90000
            },
            {
                id: 3,
                image: "pd001.jpg",
                name: "Catan US",
                quantity: 10,
                price: 12878
            },
        ],
        voucher: 0
    },
    {
        id: 4,
        date: "25/02/2022",
        dateGet: "3/02/2022",
        status: {
            id: 2,
            name: "Hoàn thành"
        },
        products: [
            {
                id: 0,
                image: "pd001.jpg",
                name: "Catan US",
                quantity: 1,
                price: 90000
            },
            {
                id: 1,
                image: "pd001.jpg",
                name: "Thám tử lừng danh Conan - Hồi kết",
                quantity: 3,
                price: 300000
            },
            {
                id: 2,
                image: "pd001.jpg",
                name: "Catan US",
                quantity: 2,
                price: 90000
            },
            {
                id: 3,
                image: "pd001.jpg",
                name: "Catan US",
                quantity: 10,
                price: 12878
            },
        ],
        voucher: 0,
        feedbacked: true
    }
    ],
    page: 1,
    status: 4,
    isFeedback: false,
    renderHtml() {
        document.querySelector(".user-info-container").innerHTML = `
        ${!this.isFeedback ? `
            <div class="history-header">
                <span class="status-btn ${this.status == 4 ? "active" : ""}" data-code="4">Tất cả</span>
                <span class="status-btn ${this.status == 0 ? "active" : ""}" data-code="0">Chờ xác nhận</span>
                <span class="status-btn ${this.status == 1 ? "active" : ""}" data-code="1">Đang vận chuyển</span>
                <span class="status-btn ${this.status == 2 ? "active" : ""}" data-code="2">Đã nhận hàng</span>
                <span class="status-btn ${this.status == 3 ? "active" : ""}" data-code="3">Đã hủy</span>
            </div>
            <ul class="history-list">
                ${this.orders.map(order => {
                    return `
                        <li class="history-item" data-id=${order.id}>
                            <div class="history-item-header">
                                <span>Ngày tạo đơn hàng ${order.date}</span>
                                <span class="primary-text text-middle history-status">${order.status.name}</span>
                            </div>
                            <ul class="history-product-list">
                                ${order.products.map(product => {
                                    return `
                                        <li class="history-product-item">
                                            <div class="history-product-info">
                                                <img src="../img/${product.image}" class="history-product-img">
                                                <div class="history-product-info-right">
                                                    <span>${product.name}</span>
                                                    <span>x${product.quantity}</span>
                                                </div>
                                            </div>
                                            <span class="history-product-price">${utils.formatMoney(product.price*product.quantity)} VNĐ</span>
                                        </li>
                                    `
                                }).join("")}
                            </ul>
                            <div class="history-footer">
                                <div class="history-voucher-container">
                                    <span class="history-voucher">-${order.voucher}%</span>
                                </div>
                                <div class="history-footer-info">
                                    <span>Nhận sản phẩm và thanh toán trước ${order.dateGet}</span>
                                    <span class="text-middle">Tổng số tiền: 
                                        <span class="primary-text">${utils.formatMoney(utils.calculationPrice(order.products, order.voucher).lastPrice)} VNĐ</span>
                                    </span>
                                </div>
                                <div class="history-footer-action">
                                    ${order.status.id == 0 ? `
                                        <button class="btn btn-primary btn-m-long cancle-btn">Hủy đơn hàng</button>
                                    ` : order.status.id == 2 ? order.feedbacked == true ? `
                                        <span class="btn btn-success btn-m-long view">Đã đánh giá</span>
                                    ` : `<button class="btn btn-primary btn-m-long feedback-btn">Đánh giá</button>
                                    ` : order.status.id == 3 ? `
                                        <span class="btn btn-black btn-m-long view">Đã hủy</span>
                                    ` : ``}
                                </div>
                            </div>
                        </li>
                    `
                }).join("")}
            </ul>
        ` : `<div class="feedback"></div>`}`

        this.removeEvents();

        statusBtns = document.querySelectorAll(".status-btn");
        cancleBtns = document.querySelectorAll(".cancle-btn");
        feedbackBtns = document.querySelectorAll(".feedback-btn");

        this.handleEvents();
    },
    orderLoadingHandler() {
        const orderList = document.querySelector(".history-list");
        if (orderList) {
            const position = orderList.offsetHeight + orderList.getBoundingClientRect().top + window.scrollY - window.innerHeight;
            if (window.scrollY > position) {
                window.removeEventListener("scroll", userHistory.orderLoadingHandler);
                setTimeout(() => {
                    // Call Get Order API
                    userHistory.page++;
    
                    // If Orders.length > 0
                    if (1) {
                        for (let i = 0; i < 5; i++) {
                            userHistory.orders.push(order);
                        }
                        userHistory.renderHtml();
                    } else {
    
                    }
                }, 300)
            }
        }
    },
    statusPageHandler(e) {
        const item = e.target.closest(".status-btn");
        if (item.dataset.code != userHistory.status) {
            // Call Get Order by status (page 1)

            orders = [
                {
                id: 0,
                date: "25/02/2022",
                dateGet: "3/02/2022",
                status: {
                    id: 0,
                    name: "Chờ xác nhận"
                },
                products: [
                    {
                        id: 0,
                        image: "pd001.jpg",
                        name: "Catan US",
                        quantity: 1,
                        price: 90000
                    },
                    {
                        id: 1,
                        image: "pd001.jpg",
                        name: "Thám tử lừng danh Conan - Hồi kết",
                        quantity: 3,
                        price: 300000
                    },
                    {
                        id: 2,
                        image: "pd001.jpg",
                        name: "Catan US",
                        quantity: 2,
                        price: 90000
                    },
                    {
                        id: 3,
                        image: "pd001.jpg",
                        name: "Catan US",
                        quantity: 10,
                        price: 12878
                    },
                ],
                voucher: 10
                },
            ]
            userHistory.status = item.dataset.code;
            userHistory.renderHtml();
        }
    },
    cancleOrderHandler(e) {
        const orderItem = e.target.closest(".history-item");
        const index = orders.indexOf(orders.find(item => item.id == orderItem.dataset.id));
        // Pop up confirm modal
        confirmModal.init("Xác nhận hủy đơn hàng", () => {
            // Call Cancle Order API

            orders[index].status = {
                id: 3,
                name: "Hủy"
            }
            confirmModal.hiddenModal();
            userHistory.renderHtml();
        });
        confirmModal.showModal();
        userHistory.renderHtml();

    },
    feedbackHandler(e) {
        const orderItem = e.target.closest(".history-item");
        const ord = userHistory.orders.find(item => item.id == orderItem.dataset.id);
        userHistory.isFeedback = true;
        userHistory.renderHtml();
        userHeader.renderHtml({code: 3});
        feedback.init(ord);
    },
    removeEvents() {
        window.removeEventListener("scroll", this.orderLoadingHandler);
        if(statusBtns) {
            statusBtns.forEach(statusBtn => {
                statusBtn.removeEventListener("click", this.statusPageHandler);
            })
        }
        if(cancleBtns) {
            cancleBtns.forEach(cancleBtn => {
                cancleBtn.removeEventListener("click", this.cancleOrderHandler);
            })
        }
        if(feedbackBtns) {
            feedbackBtns.forEach(feedbackBtn => {
                feedbackBtn.removeEventListener("click", this.feedbackHandler);
            })
        }
    },
    handleEvents() {
        window.addEventListener("scroll", this.orderLoadingHandler);
        if(statusBtns) {
            statusBtns.forEach(statusBtn => {
                statusBtn.addEventListener("click", this.statusPageHandler);
            })
        }
        if(cancleBtns) {
            cancleBtns.forEach(cancleBtn => {
                cancleBtn.addEventListener("click", this.cancleOrderHandler);
            })
        }
        if(feedbackBtns) {
            feedbackBtns.forEach(feedbackBtn => {
                feedbackBtn.addEventListener("click", this.feedbackHandler);
            })
        }
    },
    init() {
        history.scrollRestoration = 'manual';
        this.isFeedback = false; 
        this.renderHtml();
    }
}

export default userHistory;