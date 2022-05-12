import modal from "../utils/modal.js"
import cart from "../cart.js"

let voucherInput;
let voucherApplyBtn;
let voucherChecks;
let voucherGetBtn;
let voucherAddBtns;
let voucherBackBtn;
let modalSelectBtn;
let id = 0;


const voucher = {
    isGet: false,
    voucherAllList: [],
    voucherList: [],
    voucherSelected: {},
    renderHtml() {
        if (document.querySelector(".voucher")) {
            const voucherModal = document.querySelector(".voucher").closest(".modal");
            voucherModal.innerHTML = `
                <div class="modal-overlay"></div>
                <div class="modal-body">
                <div class="voucher">
                <div class="voucher-header border-b-dashed">
                ${!this.isGet ? `
                <span class="voucher-heading">Nhập mã Voucher</span>
                                <div class="voucher-action">
                                    <input type="text" class="voucher-input">
                                    <span class="voucher-message primary-text text-small"></span>
                                    <button class="btn btn-white voucher-apply-btn">Áp dụng</button>
                                </div>
                            ` : `
                                <span class="voucher-back-btn">&lt; Trở lại</span>
                                <span class="voucher-heading">Lấy mã voucher</span>
                            `}
                        </div>
                        <ul class="voucher-list border-b-dashed">
                            ${!this.isGet ?
                                this.voucherList.length === 0 ? 
                                `<div class="voucher-text">
                                    <span>Bạn chưa có voucher nào</span>
                                </div>` :
                                this.voucherList.map((item, index) => {
                                    return `
                                        <li class="voucher-item" data-id=${item.id || index}>
                                            <div class="voucher-info">
                                                <img src="../img/icon_voucher.png" alt="">
                                                <div class="voucher-content">
                                                    <div class="voucher-content-header">
                                                        <span class="voucher-name">${item.name}</span>
                                                        <span class="voucher-discount">( Giảm ${item.value}% )</span>
                                                    </div>
                                                    <span class="primary-text">Sắp hết hạn: ${item.dateExpire}</span>
                                                </div>
                                            </div>
                                            <input type="checkbox" class="voucher-check" ${
                                                this.voucherSelected.id == item.id ? "checked" : ""
                                            }>
                                        </li>
                                    `
                                }).join("")
                            : this.voucherAllList.length === 0 ? 
                                `<div class="voucher-text">
                                    <span>Hiện không có voucher nào</span>
                                </div>`
                            : this.voucherAllList.map((item) => {
                                return `
                                    <li class="voucher-item" data-id=${item.id}>
                                        <div class="voucher-info">
                                            <img src="../img/icon_voucher.png" alt="">
                                            <div class="voucher-content">
                                                <div class="voucher-content-header">
                                                    <span class="voucher-name">${item.name}</span>
                                                    <span class="voucher-discount">( Giảm ${item.value}% )</span>
                                                </div>
                                                <span class="primary-text">Sắp hết hạn: ${item.dateExpire}</span>
                                            </div>
                                        </div>
                                        ${this.voucherList.find(vch => vch.id == item.id) ? `
                                            <span class="voucher-add-text">Đã lấy</span>
                                        ` : `
                                            <span class="voucher-add-text voucher-add-btn">Lấy mã</span>
                                        `}
                                    </li>
                                `
                            }).join("")}
                        </ul>
                        <div class="voucher-footer">
                            ${!this.isGet ? `
                                <span class="voucher-get-btn">Lấy mã voucher</span>
                                <div class="voucher-footer-btn">
                                    <button class="btn btn-transparent modal-close-btn">Đóng</button>
                                    <button class="btn btn-m-long btn-primary modal-select-btn">OK</button>
                                </div>
                            ` : ``}
                        </div>
                    </div>
                </div>
            `
            modal.init();
            this.removeEvents();
    
            voucherInput = document.querySelector(".voucher-input");
            voucherApplyBtn = document.querySelector(".voucher-apply-btn");
            voucherChecks = document.querySelectorAll(".voucher-check");
            voucherGetBtn = document.querySelector(".voucher-get-btn");
            voucherAddBtns = document.querySelectorAll(".voucher-add-btn");
            voucherBackBtn = document.querySelector(".voucher-back-btn");
            modalSelectBtn = document.querySelector(".modal-select-btn");
    
            this.handleEvents();
        }
    },
    voucherApplyHandler() {
        // Call GetVoucherAPI

        let voucherInfo = {
            id: id++,
            name: "BGKTPM",
            value: Math.floor(Math.random() * (100 - 1 + 1)) + 1,
            dateExpire: "25/05/2022"
        }
        voucher.voucherList.push(voucherInfo);
        voucher.voucherSelected = {...voucherInfo};
        voucher.renderHtml();
    },
    checkHandler(e) {
        if (e.target.checked) {
            const voucherItem = e.target.closest(".voucher-item");
            voucher.voucherList.forEach(item => {
                if (item.id == voucherItem.dataset.id) {
                    voucher.voucherSelected = item;
                }
            })
        } else {
            voucher.voucherSelected = {};   
        }
        voucher.renderHtml();
    },
    modalSelectHandler() {
        cart.renderHtml();
        const voucherModal = document.querySelector(".voucher").closest(".modal");
        const index = Array.from(document.querySelectorAll(".modal")).indexOf(voucherModal);
        modal.hiddenModal(index);
    },
    voucherGetHandler() {
        voucher.isGet = true;
        voucher.renderHtml();
    },
    voucherBackHandler() {
        voucher.isGet = false;
        voucher.renderHtml();
    },
    voucherAddHandler(e) {
        const voucherItem = e.target.closest(".voucher-item");
        const vch = voucher.voucherAllList.find(item => item.id == voucherItem.dataset.id);
        voucher.voucherList.push(vch);
        voucher.renderHtml();
    },
    removeEvents() {
        if (voucherApplyBtn)
            voucherApplyBtn.removeEventListener("click", this.voucherApplyHandler);
        if (voucherChecks) {
            voucherChecks.forEach(voucherCheck => {
                voucherCheck.removeEventListener("click", this.checkHandler);
            })
        }
        if (voucherGetBtn) {
            voucherGetBtn.removeEventListener("click", this.voucherGetHandler);
        }
        if (voucherBackBtn) {
            voucherBackBtn.removeEventListener("click", this.voucherBackHandler);
        }
        if (voucherAddBtns) {
            voucherAddBtns.forEach(voucherAddBtn => {
                voucherAddBtn.removeEventListener("click", this.voucherAddHandler);
            })
        }
    },
    handleEvents() {
        if (voucherApplyBtn) 
            voucherApplyBtn.addEventListener("click", this.voucherApplyHandler);
        if (voucherChecks) {
            voucherChecks.forEach(voucherCheck => {
                voucherCheck.addEventListener("click", this.checkHandler);
            })
        }
        if (modalSelectBtn) {
            modalSelectBtn.addEventListener("click", this.modalSelectHandler)
        }
        if (voucherGetBtn) {
            voucherGetBtn.addEventListener("click", this.voucherGetHandler);
        }
        if (voucherBackBtn) {
            voucherBackBtn.addEventListener("click", this.voucherBackHandler);
        }
        if (voucherAddBtns) {
            voucherAddBtns.forEach(voucherAddBtn => {
                voucherAddBtn.addEventListener("click", this.voucherAddHandler);
            })
        }
    },
    init() {    
        // Call Get All voucher API

        this.voucherAllList = [
            {
                id: 0,
                name: "ancbcs",
                value: 10,
                dateExpire: "25/02/2022"
            },
            {
                id: 1,
                name: "uias",
                value: 23,
                dateExpire: "25/02/2022"
            },
            {
                id: 2,
                name: "kuro",
                value: 40,
                dateExpire: "25/02/2022"
            }
        ]
        this.renderHtml();
    }
}

export default voucher;