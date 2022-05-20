import api from "./api.js"

const orderUrl = `${api.route}/orders`

const orderAPI = {
    async addOrder(req, token, addOrderHandler = () => {}, errHandler = () => api.errHandler) {
        const params = {
            url: orderUrl,
            method: "POST",
            token: token,
            req: req,
            loading: true
        }
        await api.callAPI(params, addOrderHandler, errHandler);
    },
    // async updateOrder(getListCategoryHandler = () => {}, errHandler = () => {}) {
    //     const params = {
    //         url: categoryUrl,
    //         method: "GET",
    //         loading: true
    //     }
    //     await api.callAPI(params, getListCategoryHandler, errHandler);
    // },
}

export default orderAPI;