import modal from "../utils/modal.js"

const notifyModal = {
    renderHtml(content, type) {
        if (!document.querySelector(".modal .notification")) {
            document.querySelector("body").innerHTML += `
                <div class="modal">
                    <div class="modal-overlay"></div>
                    <div class="modal-body">
                        <div class="notification">
                            ${type === 0 ? `
                                <i class="fa-regular fa-circle-check"></i>
                            ` : ``}
                            <span>${content}</span>
                        </div>
                    </div>
                </div>
            `
        }
        modal.init();
    },
    hiddenModal() {
        const modals = document.querySelectorAll(".modal");
        const notifyModal = document.querySelector(".modal .notification").closest(".modal");
        const index = Array.from(modals).indexOf(notifyModal);
        modal.hiddenModal(index);
    },
    showModal() {
        const modals = document.querySelectorAll(".modal");
        const notifyModal = document.querySelector(".modal .notification").closest(".modal");
        const index = Array.from(modals).indexOf(notifyModal);
        modal.showModal(index);
    },
    init(content, type = 0) {
        this.renderHtml(content, type);
    }
}

export default notifyModal;