const categoryList = [
    {
        id: 0,
        name: "Gia đình",
        popularProducts: [
            {
                id: 0,
                name: "Catan US"
            },
            {
                id: 1,
                name: "Thám tử lừng danh Conan"
            }
        ],
        bestSellerProducts: [
            {
                id: 1,
                name: "Catan US"
            },
        ]
    },
    {
        id: 1,
        name: "Chiến thuật",
        popularProducts: [
            {
                id: 0,
                name: "Catan US"
            },
            {
                id: 1,
                name: "Thám tử lừng danh Conan"
            }
        ],
        bestSellerProducts: [
            {
                id: 1,
                name: "Catan US"
            },
        ]
    },
    {
        id: 0,
        name: "Trẻ em",
        popularProducts: [
            {
                id: 0,
                name: "Catan US"
            },
            {
                id: 1,
                name: "Thám tử lừng danh Conan"
            }
        ],
        bestSellerProducts: [
            {
                id: 1,
                name: "Catan US"
            },
        ]
    },
    {
        id: 0,
        name: "Việt Nam",
        popularProducts: [
            {
                id: 0,
                name: "Catan US"
            },
            {
                id: 1,
                name: "Thám tử lừng danh Conan"
            }
        ],
        bestSellerProducts: [
            {
                id: 1,
                name: "Catan US"
            },
        ]
    },
    {
        id: 0,
        name: "US",
        popularProducts: [
            {
                id: 0,
                name: "Catan US"
            },
            {
                id: 1,
                name: "Thám tử lừng danh Conan"
            }
        ],
        bestSellerProducts: [
            {
                id: 1,
                name: "Catan US"
            },
        ]
    },
    {
        id: 0,
        name: "Trinh thám",
        popularProducts: [
            {
                id: 0,
                name: "Catan US"
            },
            {
                id: 1,
                name: "Thám tử lừng danh Conan"
            }
        ],
        bestSellerProducts: [
            {
                id: 1,
                name: "Catan US"
            },
        ]
    },
]

const category = {
    renderHtml() {
        document.querySelector(".category").innerHTML = `
            <span class="category-heading">Danh mục sản phẩm</span>
            <ul class="category-list">
                ${categoryList.map(item => {
                    return `
                        <li class="category-item">
                            <span class="category-name">Board game ${item.name}</span>
                            <i class="fa-solid fa-caret-right"></i>
                            <div class="category-products">
                                <span class="category-products-heading">Nổi bật nhất</span>
                                <ul class="catefory-products-list">
                                    ${item.popularProducts.map(product => {
                                        return `
                                            <li class="category-products-item" data-id=${product.id}>
                                                <a href="./pages/product_detail.html?product-id=${product.id}">${product.name}</a>
                                            </li>
                                        `
                                    }).join("")}
                                </ul>
                                <span class="category-products-heading">Bán chạy</span>
                                <ul class="catefory-products-list">
                                    ${item.bestSellerProducts.map(product => {
                                        return `
                                            <li class="category-products-item" data-id=${product.id}>
                                                <a href="./pages/product_detail.html?product-id=${product.id}">${product.name}</a>
                                            </li>
                                        `
                                    }).join("")}
                                </ul>
                            </div>
                        </li>
                    `
                }).join("")}
            </ul>
        `;
    },
    init() {
        this.renderHtml();
    }
} 

export default category;
