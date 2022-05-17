import api from "./api.js"

const cartUrl = `${api.route}/cart`

const cartAPI = {
    // async getListCategory(getListCategoryHandler = () => {}, errHandler = () => {}) {
    //     const params = {
    //         url: categoryUrl,
    //         method: "GET",
    //         loading: true
    //     }
    //     await api.callAPI(params, getListCategoryHandler, errHandler);
    // },
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
    async updateCart(req, token, updateCartHandler = () => {}, errHandler = () => {}) {
        const params = {
            url: `${cartUrl}/${req.productId}`,
            method: "PATCH",
            token: token,
            req: req,
            loading: true
        }
        console.log(params)
        await api.callAPI(params, updateCartHandler, errHandler);
    },
}

export default cartAPI;