import api from "./api.js"

const voucherUrl = `${api.route}/vouchers`
const getAllVoucherUrl = `${api.route}/vouchers/`;
const getVoucherUrl = `${api.route}/vouchers/`

const voucherAPI = {
    async getListVoucher(req, getListVoucherHandler = () => {}, errHandler = () => {}) {
        const param = {
            url: signInUrl,
            method: "GET",
            req: req,
        }
        await api.callAPI(param, getListVoucherHandler, errHandler);
    },
    async getVoucher(req, token, getVoucherHandler = () => {}, errHandler = () => {}) {
        const param = {
            url: `${voucherUrl}/${req.id}`,
            method: "GET",
            req: req,
            token: token,
            loading: true
        }
        await api.callAPI(param, getVoucherHandler, errHandler);
    }
}

export default voucherAPI;