const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

let modals;
let modalOverlays;
let modalCloseBtnList;

const modal = {
  showModal(index) {
    $("body").style.overflow = "hidden";
    $$(`.modal`)[index].classList.add("active");
  },
  hiddenModal(index) {
    $("body").style.overflow = "auto";
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
  init() {
    modals = $$(".modal");
    modalOverlays = $$(".modal-overlay");
    modalCloseBtnList = [];
    modals.forEach((mdl) => {
      modalCloseBtnList.push(mdl.querySelectorAll(".modal-close-btn"));
    });
    this.handleEvents();
  },
};

export default modal;
