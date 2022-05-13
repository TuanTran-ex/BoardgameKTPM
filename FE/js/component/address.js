import modal from "../utils/modal.js"
import payment from "../payment.js"

const apiUrl = "https://provinces.open-api.vn/api/?depth=3"

let addressProvince;
let addressDistrict;
let addressWard;
let addressFullname;
let addressPhone;
let addressAddressDetail;

let id = 4;

const address = {
    provinces: [],
    provinceSelected: {},
    districtSelected: {},
    wardSelected: {},
    fullname: "",
    phone: "",
    addressDetail: "",
    async getProvince() {
        const res = await fetch(apiUrl);
        return res.json();
    },
    renderHtml() {
        if (document.querySelector(".address")) {
            const addressModal = document.querySelector(".address").closest(".modal");
            addressModal.innerHTML = `
                <div class="modal-overlay"></div>
                <div class="modal-body">
                    <div class="address">
                        <span class="address-header">Địa chỉ mới</span>
                        <form class="address-form">
                            <div class="address-form-group">
                                <label for="" class="address-form-label">Họ và tên</label>
                                <input type="text" class="address-form-control" name="addressFullname" value="${this.fullname}">
                                <span class="address-form-message primary-text"></span>
                            </div>
                            <div class="address-form-group">
                                <label for="" class="address-form-label">Số điện thoại</label>
                                <input type="text" class="address-form-control" placeholder="(+84)" name="addressPhone" value="${this.phone}">
                                <span class="address-form-message primary-text"></span>
                            </div>
                            <div class="address-form-group">
                                <label for="" class="address-form-label">Tỉnh/Thành phố</label>
                                <select name="addressProvince" id="" class="address-form-control address-province">
                                    ${this.provinces.map(province => {
                                        return `
                                            <option value="${province.code}" 
                                                ${province.code === this.provinceSelected.code ? "selected" : ""}
                                            >
                                                ${province.name}
                                            </option>
                                        `
                                    }).join("")}
                                </select>
                            </div>
                            <div class="address-form-group">
                                <label for="" class="address-form-label">Quận/Huyện</label>
                                <select name="addressDistrict" id="" class="address-form-control address-district">
                                    ${this.provinces.find(item => {
                                        return item.code === this.provinceSelected.code
                                    }).districts.map(district => {
                                        return `
                                            <option value="${district.code}"
                                                ${district.code === this.districtSelected.code ? "selected" : ""}
                                            >
                                                ${district.name}
                                            </option>
                                        `
                                    }).join("")}
                                </select>
                            </div>
                            <div class="address-form-group">
                                <label for="" class="address-form-label">Phường/Xã</label>
                                <select name="addressWard" id="" class="address-form-control address-ward">
                                    ${this.provinces.find(item => {
                                        return item.code === this.provinceSelected.code
                                    }).districts.find(item => {
                                        return item.code === this.districtSelected.code
                                    }).wards.map(ward => {
                                        return `
                                            <option value="${ward.code}"
                                                ${ward.code === this.wardSelected.code ? "selected" : ""}
                                            >
                                                ${ward.name}
                                            </option>
                                        `
                                    }).join("")}
                                </select>
                            </div>
                            <div class="address-form-group">
                                <label for="" class="address-form-label">Địa chỉ cụ thể</label>
                                <input type="text" class="address-form-control" name="addressAddress" value="${this.addressDetail}">
                                <span class="address-form-message primary-text"></span>
                            </div>
                            <div class="address-form-group checkbox">
                                <input type="checkbox" class="address-checkbox" id="address-checkbox" name="address-default">
                                <label for="address-checkbox">Đặt làm mặc định</label>
                            </div>
                            <div class="address-form-footer">
                                <span class="btn btn-transparent btn-long modal-close-btn">Trở lại</span>
                                <button class="btn btn-primary btn-long">Hoàn thành</button>
                            </div>
                        </form>
                    </div>
                </div>
            `

            modal.init();
            this.removeEvents();
    
            addressProvince = document.querySelector(".address-province");
            addressDistrict = document.querySelector(".address-district");
            addressWard = document.querySelector(".address-ward");
            addressFullname = document.querySelector("input[name='addressFullname']");
            addressPhone = document.querySelector("input[name='addressPhone']");
            addressAddressDetail = document.querySelector("input[name='addressAddress']");
    
            this.handleEvents();

            Validator({
                form: ".address-form",
                formGroupSelector: ".address-form-group",
                errorSelector: ".address-form-message",
                rules: [
                    Validator.isRequired('input[name="addressName"]',"Vui lòng nhập họ và tên"),
                    Validator.isRequired('input[name="addressPhone"]', "Vui lòng nhập email"),
                    Validator.isOnlyNumber('input[name="addressPhone"]', "Vui lòng chỉ nhập số"),
                    Validator.minLength('input[name="addressPhone"]', 10),
                    Validator.maxLength('input[name="addressPhone"]', 11),
                    Validator.isRequired('input[name="addressAddress"]', "Vui lòng nhập địa chỉ"),
                ],
                onSubmit: function (data) {
                    console.log(data);

                    // Call address new API

                    payment.init();
                    const modals = Array.from(document.querySelectorAll(".modal"));
                    const addressModal = document.querySelector(".modal .address").closest(".modal");
                    const index = modals.indexOf(addressModal);
                    modal.hiddenModal(index);
                }
            })
        }
    },
    addressProvinceHandler(e) {
        address.provinceSelected = {...address.provinces.find(item => item.code == e.target.value)};
        address.districtSelected = {...address.provinceSelected.districts[0]}
        address.wardSelected = {...address.districtSelected.wards[0]};
        address.renderHtml();
    },
    addressDistrictHandler(e) {
        address.districtSelected = {...address.provinceSelected.districts.find(item => item.code == e.target.value)};
        address.wardSelected = {...address.districtSelected.wards[0]};
        address.renderHtml();
    },
    infoChangeHandler(e) {
        const input = e.target.closest("input");
        switch (input.name) {
            case "addressFullname":
                address.fullname = input.value;
                break;
            case "addressPhone":
                address.phone = input.value;
                break;
            case "addressAddress":
                address.addressDetail = input.value;
                break;
        }
    },
    removeEvents() {
        if (addressProvince)
            addressProvince.removeEventListener("change", this.addressProvinceHandler);
        if (addressDistrict) 
            addressDistrict.addEventListener("change", this.addressDistrictHandler);
         if (addressFullname) 
            addressFullname.removeEventListener("change", this.infoChangeHandler);
        if (addressPhone) 
            addressPhone.removeEventListener("change", this.infoChangeHandler);
        if (addressAddressDetail) 
            addressAddressDetail.removeEventListener("change", this.infoChangeHandler);
    },
    handleEvents() {
        if (addressProvince) 
            addressProvince.addEventListener("change", this.addressProvinceHandler);
        if (addressDistrict) 
            addressDistrict.addEventListener("change", this.addressDistrictHandler);
        if (addressFullname) 
            addressFullname.addEventListener("change", this.infoChangeHandler);
        if (addressPhone) 
            addressPhone.addEventListener("change", this.infoChangeHandler);
        if (addressAddressDetail) 
            addressAddressDetail.addEventListener("change", this.infoChangeHandler);
    },
    async init() {    
        if (this.provinces.length === 0) {
            await this.getProvince()
                .then(data => {
                    this.provinces = [...data];
                    this.provinceSelected = {...this.provinces[0]};
                    this.districtSelected = {...this.provinceSelected.districts[0]}
                    this.wardSelected = {...this.districtSelected.wards[0]};
                })
                .catch(err => {
                    
                })
            
            this.fullname = "";
            this.phone = "";
            this.addressDetail = "";
        }
        this.renderHtml();
    }
}

export default address;