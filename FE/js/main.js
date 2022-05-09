import header from "./component/header.js";
import footer from "./component/footer.js";
import banner from "./component/banner.js";
import category from "./component/category.js";
import productList from "./component/productList.js";

import slider from "./utils/slider.js";

const footerContainer = document.querySelector(".footer");
const headerContainer = document.querySelector(".header");
const bannerContainer = document.querySelector(".banner");
const categoryContainer = document.querySelector(".category");
const productsContainer = document.querySelector(".products");

const app = {
  init() {
    header.init();
    productList.init();
    headerContainer.innerHTML = header.headerHtml;
    footerContainer.innerHTML = footer;
    bannerContainer.innerHTML = banner;
    categoryContainer.innerHTML = category;
    productsContainer.innerHTML = productList.productListHtml;

    slider.init();
    productList.pagination();
    productList.handleEvents();
  },
};

export default app;
