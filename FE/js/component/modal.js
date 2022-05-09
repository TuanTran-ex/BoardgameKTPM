const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

const modals = $$(".modal");
const modalOverlays = $$(".modal-overlay");
const modalCloseBtnList = [];
modals.forEach((mdl) => {
  modalCloseBtnList.push(mdl.querySelectorAll(".modal-close-btn"));
});

const modal = {
  showModal(index) {
    $$(`.modal`)[index].classList.add("active");
  },
  hiddenModal(index) {
    $$(`.modal`)[index].classList.remove("active");
  },
  handleEvents() {
    // Handle modal display/hidden
    modalOverlays.forEach((modalOverlay, index) => {
      modalOverlay.onclick = () => this.hiddenModal(index);
    });
    modalCloseBtnList.forEach((closeBtns, index) => {
      closeBtns.forEach((closeBtn) => {
        closeBtn.onclick = () => {
          this.hiddenModal(index);
        };
      });
    });
  },
};

export default modal;
