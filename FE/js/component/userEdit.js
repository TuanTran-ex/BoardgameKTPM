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
                    <span class="user-info-content">${user.Username}</span>
                </div>
                <div class="user-info-form-group">
                    <label class="user-info-form-label">Họ và tên</label>
                    <input type="text" class="user-info-form-control" placholder="Chưa có" name="fullname" value="${user.FullName ? user.FullName : ""}">
                    <span class="user-info-form-message"></span>
                </div>
                <div class="user-info-form-group">
                    <label class="user-info-form-label">Email</label>
                    <input type="email" class="user-info-form-control" value="${user.Email}" name="email">
                    <span class="user-info-form-message"></span>
                </div>
                <div class="user-info-form-group">
                    <label class="user-info-form-label">Số điện thoại</label>
                    <input type="text" class="user-info-form-control" placeholder="Chưa có" name="phone" value="${user.Phone ? user.Phone : ""}">
                    <span class="user-info-form-message"></span>
                </div>
                <div class="user-info-form-group">
                    <label class="user-info-form-label">Giới tính</label>
                    <div class="user-info-form-radio">
                        <div class="user-info-option-form-group">
                            <input type="radio" value="0" name="gender" id="user-gender-0" ${user.Gender == 0 ? "checked" : ""}>
                            <label for="user-gender-0">Nam</label>
                        </div>
                        <div class="user-info-option-form-group">
                            <input type="radio" value="1" name="gender" id="user-gender-1" ${user.Gender == 1 ? "checked" : ""}>
                            <label for="user-gender-1">Nữ</label>
                        </div>
                        <div class="user-info-option-form-group">
                            <input type="radio" value="2" name="gender" id="user-gender-2" ${!user.Gender ? "checked" : ""}>
                            <label for="user-gender-2">Khác</label>
                        </div>
                    </div>
                </div>
                <div class="user-info-form-group">
                    <label class="user-info-form-label">Ngày sinh</label>
                    <input type="date" class="user-info-form-control" value="${user.DOB ? user.DOB : ""}" name="birthday">
                    <span class="user-info-form-message"></span>
                </div>
                <div class="user-info-avatar">
                    <img src="../img/${user.Avatar ? user.Avatar : "ava001.jpg"}" class="user-info-avatar-image"></img>
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