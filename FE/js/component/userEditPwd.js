import confirmModal from "../component/confirmModal.js"
import notifyModal from "../component/notifyModal.js"
import account from "../account.js"
import header from "./header.js"

let pwdIcons;

const userEditPwd = {
    renderHtml(user) {
        document.querySelector(".user-info-container").innerHTML = `
            <form class="user-info-form">
                <div class="user-info-form-group">
                    <label class="user-info-form-label">Mật khẩu cũ</label>
                    <input type="password" class="user-info-form-control" name="oldPassword">
                    <span class="user-info-form-message"></span>
                    <div class="user-info-form-icon">
                        <i class="fa-solid fa-eye active"></i>
                        <i class="fa-solid fa-eye-slash"></i>
                    </div>
                </div>
                <div class="user-info-form-group">
                    <label class="user-info-form-label">Mật khẩu mới</label>
                    <input type="password" class="user-info-form-control" name="newPassword">
                    <span class="user-info-form-message"></span>
                    <div class="user-info-form-icon">
                        <i class="fa-solid fa-eye active"></i>
                        <i class="fa-solid fa-eye-slash"></i>
                    </div>
                </div>
                <div class="user-info-form-group">
                    <label class="user-info-form-label">Xác nhận mật khẩu</label>
                    <input type="password" class="user-info-form-control" name="rePassword">
                    <span class="user-info-form-message"></span>
                    <div class="user-info-form-icon">
                        <i class="fa-solid fa-eye active"></i>
                        <i class="fa-solid fa-eye-slash"></i>
                    </div>
                </div>
                <div class="user-info-form-group">
                    <label class="user-info-form-label"></label>
                    <button class="btn btn-long btn-primary user-info-form-btn">Xác nhận</button>
                </div>
            </form>
        `

        this.removeEvents();

        pwdIcons = document.querySelectorAll(".user-info-form-icon");

        Validator({
            form: ".user-info-form",
            formGroupSelector: ".user-info-form-group",
            errorSelector: ".user-info-form-message",
            rules: [
                Validator.isRequired('input[name="oldPassword"]', "Vui lòng nhập mật khẩu cũ"),
                Validator.minLength('input[name="oldPassword"]', 6),
                Validator.maxLength('input[name="oldPassword"]', 50),
                Validator.isRequired('input[name="newPassword"]', "Vui lòng nhập mật khẩu mới"),
                Validator.minLength('input[name="newPassword"]', 6),
                Validator.maxLength('input[name="newPassword"]', 50),
                Validator.isRequired('input[name="rePassword"]', "Vui lòng nhập mật khẩu"),
                Validator.minLength('input[name="rePassword"]', 6),
                Validator.maxLength('input[name="rePassword"]', 50),
                Validator.isConfirmed('input[name="rePassword"]',
                function () {
                    return document.querySelector('.user-info-form input[name="newPassword"]').value;
                }, "Mật khẩu nhập lại không đúng"),
            ],
            onSubmit: function (data) {
                console.log(data);
                // Pop up confirm modal
                confirmModal.init("Xác nhận thay đổi mật khẩu", userEditPwd.submitChangeHandler);
                confirmModal.showModal();
                account.renderHtml();
                header.renderHtml();
            },
        });

        this.handleEvents();
    },
    submitChangeHandler() {
        // Call User Upadate API

        // Close confirm modal
        confirmModal.hiddenModal();

        // Pop up notify modal
        notifyModal.init("Thay đổi thành công");
        notifyModal.showModal();
        account.renderHtml();
    },
    hiddenDisplayPwdHandler(e) {
        const pwdInput = e.target.closest(".user-info-form-group").querySelector("input");
        const pwdIcon = e.target.closest(".user-info-form-icon");
        pwdInput.type === "password" ? pwdInput.type = "text" : pwdInput.type = "password";
        pwdIcon.querySelectorAll("i").forEach((icon) => {
          icon.classList.toggle("active");
        });
    },
    removeEvents() {
        if (pwdIcons) {
            pwdIcons.forEach(pwdIcon => {
                pwdIcon.removeEventListener("click", this.hiddenDisplayPwdHandler);
            })
        }
    },
    handleEvents() {
        if (pwdIcons) {
            pwdIcons.forEach(pwdIcon => {
                pwdIcon.addEventListener("click", this.hiddenDisplayPwdHandler);
            })
        }
    },
    init(user) {
        this.renderHtml(user)
    }
}

export default userEditPwd;