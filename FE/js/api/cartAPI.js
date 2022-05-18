import api from "./api.js"

const cartUrl = `${api.route}/cart`

const cartAPI = {
    async addCart(req, token, addCartHandler = () => {}, errHandler = () => {}) {
        const params = {
            url: cartUrl,
            method: "POST",
            token: token,
            req: req,
            loading: true
        }
        await api.callAPI(params, addCartHandler, errHandler);
    },
    async updateCart(req, token, updateCartHandler = () => {}, errHandler = () => {}, loading = true) {
        const params = {
            url: `${cartUrl}/${req.productId}`,
            method: "PATCH",
            token: token,
            req: req,
            loading: loading
        }
        await api.callAPI(params, updateCartHandler, errHandler);
    },
    async deleteCart(req, token, deleteCartHandler = () => {}, errHandler = () => {}, loading = true) {
        const params = {
            url: `${cartUrl}/${req.id}`,
            method: "DELETE",
            token: token,
            loading: loading
        }
        await api.callAPI(params, deleteCartHandler, errHandler);
    },
}

export default cartAPI;