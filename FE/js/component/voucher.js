import modal from "../utils/modal.js"
import cart from "../cart.js"

let voucherInput;
let voucherApplyBtn;
let voucherChecks;
let modalSelectBtn;
let id = 0;

const voucher = {
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
                        <span class="voucher-heading">Nhập mã Voucher</span>
                        <div class="voucher-action">
                            <input type="text" class="voucher-input">
                            <span class="voucher-message primary-text text-small"></span>
                            <button class="btn btn-white voucher-apply-btn">Áp dụng</button>
                        </div>
                    </div>
                    <ul class="voucher-list border-b-dashed">
                        ${this.voucherList.map((item, index) => {
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
                                        this.voucherSelected.id == (item.id || index) ? "checked" : ""
                                    }>
                                </li>
                            `
                        })}
                    </ul>
                    <div class="voucher-footer">
                        <button class="btn btn-transparent modal-close-btn">Đóng</button>
                        <button class="btn btn-m-long btn-primary modal-select-btn">OK</button>
                    </div>
                </div>
                </div>
            `
            modal.init();
            this.deleteEvents();
    
            voucherInput = document.querySelector(".voucher-input");
            voucherApplyBtn = document.querySelector(".voucher-apply-btn");
            voucherChecks = document.querySelectorAll(".voucher-check");
            modalSelectBtn = document.querySelector(".modal-select-btn");
    
            this.handleEvents();
        }
    },
    voucherApplyHandler() {
        // Call GetVoucherAPI)
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
    deleteEvents() {
        if (voucherApplyBtn)
            voucherApplyBtn.removeEventListener("click", this.voucherApplyHandler);
        if (voucherChecks) {
            voucherChecks.forEach(voucherCheck => {
                voucherCheck.removeEventListener("click", this.checkHandler);
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
    },
    init() {    
        this.renderHtml();
    }
}

export default voucher;