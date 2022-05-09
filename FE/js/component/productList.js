const product = {
  image: "pd001.jpg",
  name: "Catan US",
  description:
    "Chuyển thể từ bộ truyện tranh nổi tiếng cùng tên TOP 1 Best Seller Fahasa 2016-2018",
  price: "1.600.000 VNĐ",
};

const productList = {
  productListHtml: "",
  pageActive: 1,
  totalPage: 1,
  productLst: [],
  getItem() {
    return {
      firstPageBtn: document.querySelector(".products-pagination-first"),
      lastPageBtn: document.querySelector(".products-pagination-last"),
      previousPageBtn: document.querySelector(".products-pagination-previous"),
      nextPageBtn: document.querySelector(".products-pagination-next"),
      productPaginationList: document.querySelector(
        ".products-pagination-list"
      ),
    };
  },
  pagination() {
    const obj = this.getItem();
    const html = this.productLst
      .map((product, index) => {
        if (index >= (this.pageActive - 1) * 10 && index < this.pageActive * 10)
          return `<div class="product-item">
                <img class="product-img" src="./img/${product.image}"></img>
                <span class="product-name">${product.name} ${index}</span>
                <span class="product-description">${product.description}</span>
                <span class="product-price">${product.price}</span>
                </div>`;
      })
      .join("");

    document.querySelector(".products-list").innerHTML = html;

    if (this.pageActive <= 1) {
      obj.firstPageBtn.classList.add("disabled");
      obj.previousPageBtn.classList.add("disabled");
      obj.lastPageBtn.classList.remove("disabled");
      obj.nextPageBtn.classList.remove("disabled");
    } else if (this.pageActive >= this.totalPage) {
      obj.lastPageBtn.classList.add("disabled");
      obj.nextPageBtn.classList.add("disabled");
      obj.firstPageBtn.classList.remove("disabled");
      obj.previousPageBtn.classList.remove("disabled");
    } else {
      obj.firstPageBtn.classList.remove("disabled");
      obj.previousPageBtn.classList.remove("disabled");
      obj.lastPageBtn.classList.remove("disabled");
      obj.nextPageBtn.classList.remove("disabled");
    }

    let paginationHtml = "";
    let firstNumber;
    let lastNumber;
    if (this.totalPage <= 5) {
      firstNumber = 1;
      lastNumber = this.totalPage;
    } else if (this.pageActive <= 3) {
      firstNumber = 1;
      lastNumber = 5;
    } else if (this.pageActive >= this.totalPage - 2) {
      firstNumber = this.totalPage - 4;
      lastNumber = this.totalPage;
    } else {
      firstNumber = this.pageActive - 2;
      lastNumber = this.pageActive + 2;
    }
    for (let i = firstNumber; i <= lastNumber; i++) {
      paginationHtml +=
        i == this.pageActive
          ? `<li class="products-pagination-item active" data-index=${i}>${i}</li>`
          : `<li class="products-pagination-item" data-index=${i}>${i}</li>`;
    }
    obj.productPaginationList.innerHTML = paginationHtml;
  },
  handleEvents() {
    const obj = this.getItem();
    obj.firstPageBtn.onclick = () => {
      if (!obj.firstPageBtn.classList.contains("disabled")) {
        this.pageActive = 1;
        this.pagination();
      }
    };
    obj.lastPageBtn.onclick = () => {
      if (!obj.lastPageBtn.classList.contains("disabled")) {
        this.pageActive = this.totalPage;
        this.pagination();
      }
    };
    obj.previousPageBtn.onclick = () => {
      if (!obj.previousPageBtn.classList.contains("disabled")) {
        this.pageActive--;
        this.pagination();
      }
    };
    obj.nextPageBtn.onclick = () => {
      if (!obj.nextPageBtn.classList.contains("disabled")) {
        this.pageActive++;
        this.pagination();
      }
    };

    obj.productPaginationList.onclick = (e) => {
      const item = e.target.closest(".products-pagination-item");
      if (item) {
        this.pageActive = Number(item.dataset.index);
        this.pagination();
      }
    };
  },
  init() {
    this.productListHtml = `
        <div class="products-header">
            <div class="products-heading">
                <span>Sản phẩm</span>
                <span class="products-quantity">//89</span>
            </div>
            <div class="products-search">
                <input type="text" class="products-search-input">
                <i class="fa-solid fa-magnifying-glass products-search-icon"></i>
            </div>
        </div>
        <div class="products-sub-header">
            <div class="products-filter">
                <span class="products-filter-heading">Sắp xếp theo</span>
                <select name="" id="" class="products-filter-select">
                    <option value="" class="products-filter-option">Mới nhất</option>
                    <option value="" class="products-filter-option">Giá thấp</option>
                    <option value="" class="products-filter-option">Giá cao</option>
                </select>
            </div>
            <div class="products-pagination">
                <button class="products-pagination-first products-pagination-btn">
                    <i class="fa-solid fa-backward"></i>
                </button>
                <button class="products-pagination-previous products-pagination-btn">
                    <i class="fa-solid fa-caret-left"></i>
                </button>
                <ul class="products-pagination-list">
                </ul>
                <button class="products-pagination-next products-pagination-btn">
                    <i class="fa-solid fa-caret-right"></i>
                </button>
                <button class="products-pagination-last products-pagination-btn">
                    <i class="fa-solid fa-forward"></i>
                </button>
            </div>
        </div>
        <div class="products-list">
        </div>
    `;
    for (let i = 0; i < 61; i++) {
      this.productLst.push(product);
    }
    this.totalPage =
      this.productLst.length % 10
        ? Math.floor(this.productLst.length / 10) + 1
        : this.productLst.length / 10;
  },
};

export default productList;
