const products = [
    {
        id: 0,
        image: "banner001.png",
        name: "Thám tử lừng danh Conan - Hồi kết",
        players: "5-10 người",
        time: "30-50 phút"
    },
    {
        id: 1,
        image: "banner001.png",
        name: "Thám tử lừng danh Conan - Hồi kết",
        players: "5-10 người",
        time: "30-50 phút"
    },
    {
        id: 2,
        image: "banner001.png",
        name: "Thám tử lừng danh Conan - Hồi kết",
        players: "5-10 người",
        time: "30-50 phút"
    }
]

const banner = {
    renderHtml() {
        document.querySelector(".banner").innerHTML = `
            <div class="banner-box-shadow"></div>
            <div class="slider">
                <div class="slider-row">
                    <ul class="slider-list" data-col="1" data-gap="0px">
                    ${products.map(item => {
                        return `
                        <a href="./pages/product_detail.html?product-id=${item.id}">
                            <li class="slider-item banner-item">
                                <div class="banner-left">
                                    <img src="./img/${item.image}" alt="" class="slider-img">
                                </div>
                                <div class="banner-right">
                                    <h3 class="banner-item-name">${item.name}</h3>
                                    <div class="banner-item-players">
                                        <i class="fa-solid fa-user"></i>
                                        <span>${item.players}</span>
                                    </div>
                                    <div class="banner-item-time">
                                        <i class="fa-solid fa-clock"></i>
                                        <span>${item.name}</span>
                                    </div>
                                    <a href="./pages/product_detail.html?product-id=${item.id}" class="banner-item-link">
                                        <span>Xem thêm...</span>
                                        <i class="fa-solid fa-caret-right"></i>
                                    </a>
                                </div>
                            </li>
                        </a>
                        `
                    }).join("")}
                    </ul>
                </div>
            </div>
        `;
    },
    init() {
        this.renderHtml();
    }
}


export default banner;
