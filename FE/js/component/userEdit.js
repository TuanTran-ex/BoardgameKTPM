import notifyModal from "./notifyModal.js";
import account from "../account.js"

let userAvatarInput;
let userAvatar;

const userEdit = {
    virtualURL: "",
    renderHtml(user) {
        document.querySelector(".user-info-container").innerHTML = `
            <form class="user-info-form">
                <div class="user-info-form-group">
                    <label class="user-info-form-label">Tên đăng nhập</label>
                    <span class="user-info-content">${user.username}</span>
                </div>
                <div class="user-info-form-group">
                    <label class="user-info-form-label">Họ và tên</label>
                    <input type="text" class="user-info-form-control" name="fullname" value="${user.fullname}">
                    <span class="user-info-form-message"></span>
                </div>
                <div class="user-info-form-group">
                    <label class="user-info-form-label">Email</label>
                    <input type="text" class="user-info-form-control" value="${user.email}" name="email">
                    <span class="user-info-form-message"></span>
                </div>
                <div class="user-info-form-group">
                    <label class="user-info-form-label">Số điện thoại</label>
                    <input type="text" class="user-info-form-control" name="phone" value="${user.phone}">
                    <span class="user-info-form-message"></span>
                </div>
                <div class="user-info-form-group">
                    <label class="user-info-form-label">Địa chỉ</label>
                    <input type="text" class="user-info-form-control" name="address" value="${user.address}">
                    <span class="user-info-form-message"></span>
                </div>
                <div class="user-info-form-group">
                    <label class="user-info-form-label">Giới tính</label>
                    <div class="user-info-form-radio">
                        <div class="user-info-option-form-group">
                            <input type="radio" value="0" name="gender" id="user-gender-0" ${user.gender == 0 ? "checked" : ""}>
                            <label for="user-gender-0">Nam</label>
                        </div>
                        <div class="user-info-option-form-group">
                            <input type="radio" value="1" name="gender" id="user-gender-1" ${user.gender == 1 ? "checked" : ""}>
                            <label for="user-gender-1">Nữ</label>
                        </div>
                        <div class="user-info-option-form-group">
                            <input type="radio" value="2" name="gender" id="user-gender-2" ${user.gender == "null" ? "checked" : ""}>
                            <label for="user-gender-2">Khác</label>
                        </div>
                    </div>
                </div>
                <div class="user-info-form-group">
                    <label class="user-info-form-label">Ngày sinh</label>
                    <input type="date" class="user-info-form-control" value="${user.birthday}" name="birthday">
                    <span class="user-info-form-message"></span>
                </div>
                <div class="user-info-avatar">
                    <img src="../img/${user.avatar != "null" ? user.avatar : "ava001.jpg"}" class="user-info-avatar-image"></img>
                    <input type="file" id="user-avatar-input" accept="image/png, image/gif, image/jpeg" hidden>
                    <label for="user-avatar-input" class="btn btn-white">Chọn ảnh</label>
                </div>
                <div class="user-info-form-group">
                    <label class="user-info-form-label"></label>
                    <button class="btn btn-primary">Lưu</button>
                </div>
            </form>
        `

        this.removeEvents();

        userAvatarInput = document.querySelector("#user-avatar-input");
        userAvatar = document.querySelector(".user-info-avatar-image")

        this.handleEvents();

        Validator({
            form: ".user-info-form",
            formGroupSelector: ".user-info-form-group",
            errorSelector: ".user-info-form-message",
            rules: [
                Validator.maxLength('input[name="fullname"]', 50),
                Validator.isEmail('input[name="email"]'),
                Validator.minLength('input[name="phone"]', 10),
                Validator.maxLength('input[name="phone"]', 11),
                Validator.isOnlyNumber('input[name="phone"]'),
                Validator.maxLength('input[name="address"]', 150),
            ],
            onSubmit: function (data) {
                console.log(data);

                // Call User Upadate API

                // Pop up modal
                notifyModal.init("Cập nhật hồ sơ");
                notifyModal.showModal();
                account.renderHtml();
            },
        });
    },
    avatarChangeHandler(e) {
        if (e.target.files[0]) {
            userEdit.virtualURL = URL.createObjectURL(e.target.files[0]);
            userAvatar.src = userEdit.virtualURL;
        }
    },
    removeEvents() {
        if (userAvatarInput) {
            userAvatarInput.removeEventListener("change", this.avatarChangeHandler);       
        }
    },
    handleEvents() {
        if (userAvatarInput) {
            userAvatarInput.addEventListener("change", this.avatarChangeHandler);       
        }
    },
    init(user) {
        this.renderHtml(user);
    }
}

export default userEdit;