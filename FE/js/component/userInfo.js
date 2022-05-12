const userInfo = {
    renderHtml(user) {
        document.querySelector(".user-info-container").innerHTML = `
            <ul class="user-info-list">
                <li class="user-info-item">
                    <span class="user-info-label">Tên đăng nhập</span>
                    <span class="user-info-content">${user.username}</span>
                </li>
                <li class="user-info-item">
                    <span class="user-info-label">Họ và tên</span>
                    <span class="user-info-content none">
                        ${user.fullname != "null" ? user.fullname : "Chưa có"}
                    </span>
                </li>
                <li class="user-info-item">
                    <span class="user-info-label">Email</span>
                    <span class="user-info-content">
                        ${user.email != "null" ? user.email : "Chưa có"}
                    </span>
                </li>
                <li class="user-info-item">
                    <span class="user-info-label">Số điện thoại</span>
                    <span class="user-info-content none">
                        ${user.phone != "null" ? user.phone : "Chưa có"}
                    </span>
                </li>
                <li class="user-info-item">
                    <span class="user-info-label">Địa chỉ</span>
                    <span class="user-info-content none">
                        ${user.address != "null" ? user.address : "Chưa có"}
                    </span>
                </li>
                <li class="user-info-item">
                    <span class="user-info-label">Giới tính</span>
                    <ul class="user-info-option-list">
                        <li class="user-info-option-item ${user.gender == 0 ? "active" : ""}">
                            <div class="user-info-option-icon"></div>
                            <span>Nam</span>
                        </li>
                        <li class="user-info-option-item ${user.gender == 1 ? "active" : ""}">
                            <div class="user-info-option-icon"></div>
                            <span>Nữ</span>
                        </li>
                        <li class="user-info-option-item ${user.gender == "null" ? "active" : ""}">
                            <div class="user-info-option-icon"></div>
                            <span>Khác</span>
                        </li>
                    </ul>
                </li>
                <li class="user-info-item">
                    <span class="user-info-label">Ngày sinh</span>
                    <span class="user-info-content">
                        ${user.birthdate != "null" ? user.birthdate : "Chưa có"}
                    </span>
                </li>
            </ul>
            <div class="user-info-avatar">
                <img src="../img/${user.avatar != "null" ? user.avatar : "ava001.jpg"}" class="user-info-avatar-image"></img>
            </div>
        `
    },
    init(user) {
        this.renderHtml(user)
    }
}

export default userInfo;