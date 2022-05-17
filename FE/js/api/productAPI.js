import api from "./api.js"

const productUrl = `${api.route}/products`

const productAPI = {
    async getListProduct(req, getListProductHandler = () => {}, errHandler = () => {}) {
        const {category, filter, key, page, pageSize} = req;
        const params = {
            url: `${productUrl}?${category ? `category=${category}` : ""}${filter ? `&filter=${filter}` : ``}${key ? `&key=${key}&` : ``}&page=${page}&pageSize=${pageSize}`,
            method: "GET",
            loading: true
        }
        await api.callAPI(params, getListProductHandler, errHandler);
    },
    // async getVoucher(req, token, getVoucherHandler = () => {}, errHandler = () => {}) {
    //     const params = {
    //         url: `${voucherUrl}/${req.id}`,
    //         method: "GET",
    //         req: req,
    //         token: token,
    //         loading: true
    //     }
    //     await api.callAPI(params, getVoucherHandler, errHandler);
    // }
}

export default productAPI;