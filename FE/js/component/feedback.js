import userHistory from "./userHistory.js"
import notifyModal from "./notifyModal.js"

let feedbackItems = [];
let feedbackRateIcons = [];
let feedbackImageBtns = [];
let feedbackBackBtn;
let feedbackSubmitBtn;
let feedbackImageDeleteBtns;


const feedback = {
    order: {}, 
    virtualURL: [],
    rate: [],
    comments: [],
    images: [],
    renderHtml() {
        document.querySelector(".feedback").innerHTML = `
            <ul class="feedback-list">
                ${this.order.products.map((item, index) => {
                    return `
                        <li class="feedback-item" data-id="${item.id}">
                            <div class="feedback-product">
                                <div class="feedback-product-info">
                                    <img class="feedback-product-img" src="../img/${item.image}">
                                    <span class="feedback-product-name">${item.name}</span>
                                </div>
                                <div class="feedback-rate">
                                    <i class="feedback-rate-icon ${this.rate[index] >= 1 ? `active fa-solid fa-star` : `fa-regular fa-star`}"></i>
                                    <i class="feedback-rate-icon ${this.rate[index] >= 2 ? `active fa-solid fa-star` : `fa-regular fa-star`}"></i>
                                    <i class="feedback-rate-icon ${this.rate[index] >= 3 ? `active fa-solid fa-star` : `fa-regular fa-star`}"></i>
                                    <i class="feedback-rate-icon ${this.rate[index] >= 4 ? `active fa-solid fa-star` : `fa-regular fa-star`}"></i>
                                    <i class="feedback-rate-icon ${this.rate[index] >= 5 ? `active fa-solid fa-star` : `fa-regular fa-star`}"></i>
                                </div>
                            </div>
                            <div class="feedback-content">
                                <textarea class="feedback-comment" placeholder="Bình luận"></textarea>
                                <div class="feedback-image">
                                    <ul class="feedback-image-list">
                                    ${this.virtualURL.length > 0 ? this.virtualURL[index].files.map(file => {
                                        return `
                                            <li class="feedback-image-item">
                                                <img class="feedback-image-img" src="${file}">
                                                <i class="fa-solid fa-circle-xmark feedback-image-delete"></i>
                                            </li>
                                        `
                                    }).join("") : ``}
                                    <label for="feedback-file-${item.id}" class="btn btn-white btn-small feedback-image-btn">Thêm ảnh</label>
                                    <input type="file" id="feedback-file-${item.id}" name="feedback-file" multiple hidden> 
                                    </ul>
                                </div>
                            </div>
                        </li>
                    `
                }).join("")}
            </ul>
            <div class="feedback-footer">
                <button class="btn btn-white feedback-back-btn btn-m-long">Trở lại</button>
                <button class="btn btn-primary feedback-submit-btn btn-m-long">Gửi nhận xét</button>
            </div>
        `

        this.removeEvents();

        feedbackItems = document.querySelectorAll(".feedback-item");
        feedbackRateIcons = [];
        feedbackImageBtns = [];
        feedbackItems.forEach(item => {
            feedbackRateIcons.push({
                id: item.dataset.id,
                icons: item.querySelectorAll(".feedback-rate-icon")
            });
            feedbackImageBtns.push({
                id: item.dataset.id,
                files: item.querySelector("input[name='feedback-file']")
            });
        })
        feedbackBackBtn = document.querySelector(".feedback-back-btn");
        feedbackSubmitBtn = document.querySelector(".feedback-submit-btn");
        feedbackImageDeleteBtns = document.querySelectorAll(".feedback-image-delete");

        this.handleEvents();
    },
    feedbackRateHandler(e) {
        const feedbackItem = e.target.closest(".feedback-item");
        const iconItem = e.target.closest(".feedback-rate-icon");
        const item = feedbackRateIcons.find(item => item.id == feedbackItem.dataset.id);
        const itemIndex = feedbackRateIcons.indexOf(item);
        const icon = Array.from(feedbackRateIcons[itemIndex].icons).find(item => item === iconItem);
        const iconIndex = Array.from(feedbackRateIcons[itemIndex].icons).indexOf(icon);
        if (iconIndex + 1 === feedback.rate[itemIndex]) {
            feedback.rate[itemIndex] = 0;
        } else {
            feedback.rate[itemIndex] = iconIndex + 1;
        }
        feedback.renderHtml(feedback.order);
    },
    feedbackImageHandler(e) {
        const feedbackItem = e.target.closest(".feedback-item");
        const fileItem = e.target.closest("input[name='feedback-file']");
        const item = feedbackImageBtns.find(item => item.id == feedbackItem.dataset.id);
        const itemIndex = feedbackImageBtns.indexOf(item);
        if (fileItem.files.length > 0) {
            if (feedback.virtualURL[itemIndex].files.length + fileItem.files.length <= 7) {
                Array.from(fileItem.files).forEach(file => {
                    feedback.virtualURL[itemIndex].files.push(URL.createObjectURL(file));
                })
                feedback.renderHtml(feedback.order);
            } else {
                notifyModal.init("Vui lòng chọn tối đa 7 ảnh", () => {}, 1);
                notifyModal.showModal();
                feedback.renderHtml();
            }
        }
    },
    feedbackBackHandler() {
        userHistory.isFeedback = false;
        userHistory.renderHtml();
    },
    feedbackSubmitHandler() {
        // Call create feedback API

        const item = userHistory.orders.find(order => order.id = feedback.order.id);
        item.feedbacked = true;

        notifyModal.init("Đánh giá thành công", () => {
            userHistory.isFeedback = false;
            userHistory.renderHtml();
        });
        notifyModal.showModal();
        window.scrollTo(0, 0);
        feedback.renderHtml();
    },
    feedbackImageDeleteHandler(e) {
        const imageItem = e.target.closest(".feedback-image-item").querySelector(".feedback-image-img");
        const productItem = e.target.closest(".feedback-item");
        const index = Array.from(feedbackItems).indexOf(productItem);
        feedback.virtualURL[index].files = feedback.virtualURL[index].files.filter(item => item != imageItem.src);
        feedback.renderHtml();
    },
    removeEvents() {
        if (feedbackRateIcons) {
            feedbackRateIcons.forEach(item => {
                item.icons.forEach(icon => {
                    icon.removeEventListener("click", this.feedbackRateHandler);
                })
            })
        }
        if (feedbackImageBtns) {
            feedbackImageBtns.forEach(item => {
                item.files.removeEventListener("change", this.feedbackImageHandler);
            })
        }
        if (feedbackBackBtn) {
            feedbackBackBtn.removeEventListener("click", this.feedbackBackHandler);
        }
        if (feedbackSubmitBtn) {
            feedbackSubmitBtn.removeEventListener("click", this.feedbackSubmitHandler);
        }
        if (feedbackImageDeleteBtns) {
            feedbackImageDeleteBtns.forEach(feedbackImageDeleteBtn => {
                feedbackImageDeleteBtn.removeEventListener("click", this.feedbackImageDeleteHandler);
            })
        }
    },
    handleEvents() {
        if (feedbackRateIcons) {
            feedbackRateIcons.forEach(item => {
                item.icons.forEach(icon => {
                    icon.addEventListener("click", this.feedbackRateHandler);
                })
            })
        }
        if (feedbackImageBtns) {
            feedbackImageBtns.forEach(item => {
                item.files.addEventListener("change", this.feedbackImageHandler);
            })
        }
        if (feedbackBackBtn) {
            feedbackBackBtn.addEventListener("click", this.feedbackBackHandler);
        }
        if (feedbackSubmitBtn) {
            feedbackSubmitBtn.addEventListener("click", this.feedbackSubmitHandler);
        }
        if (feedbackImageDeleteBtns) {
            feedbackImageDeleteBtns.forEach(feedbackImageDeleteBtn => {
                feedbackImageDeleteBtn.addEventListener("click", this.feedbackImageDeleteHandler);
            })
        }
    },
    init(order) {
        if (order.status.id != 2 || order.feedbacked === true) {
            userHistory.isFeedback = false;
            userHistory.renderHtml();
        } else {
            this.order = {...order};
            this.virtualURL = [];
            this.order.products.map(item => {
                this.virtualURL.push({
                    files: [],
                })
            })
            this.rate = [];
            this.comments = [];
            this.images = [];
            this.renderHtml(order);
        }
    }
}

export default feedback;