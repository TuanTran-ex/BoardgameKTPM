var productsApi = "http://localhost:3000/api/v1/products?page=1&pageSize=20";

function start() {
  getProductions(renderProducts);
  
  handleAddForm();
  handCreateProducts();
}

let itemId;

start();
//function
function getProductions(callback) {
  fetch(productsApi)
    .then(function (response) {
      return response.json();
    })
    .then(callback);
}

function renderProducts(products) {
  console.log(products);
  var listProductsBlock = document.querySelector("#list-products");
  var htmls = products
    .map(function (product) {
      return `
        <tr class="product-item-${product.id}">
        <td> ${product.name} </td>
        <td>${product.category}</td>
        <td>${product.source}</td>
        <td>${product.Iprice}</td>
        <td>${product.Eprice}</td>
                          <td>
                            <div>
                             <a href="./Production-editing.html"> 
                              <span class="fe fe-24 fe-edit"></span>
                              </a>
                              <a href="" data-toggle="modal" data-target="#deleteproduction">
                                <span class="fe fe-24 fe-trash-2" onclick="setId(${product.id})"></span>
                              </a>
                            </div>  
                          </td>
                        </tr> 
        `;
    })
    .join("");
  htmls += `
                              <div class="modal fade" id="deleteproduction" tabindex="-1" role="dialog" aria-labelledby="deleteproductionlabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                  <div class="modal-content">
                                    <div class="modal-header">
                                      <h5 class="modal-title" id="deleteproductionlabel">Xóa sản phẩm</h5>
                                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                      </button>
                                    </div>
                                    <div class="modal-body"> Bạn có chắc chắn muốn xóa sản phẩm này không </div>
                                    <div class="modal-footer">
                                      <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">Không</button>
                                      <button type="button" class="btn mb-2 btn-primary" onclick="handleDeleteProducts()">Đồng ý</button>
                                    </div>
                                  </div>
                                </div>
                              </div> 
    `;
  listProductsBlock.innerHTML = htmls;
}

// newArray = array.filter(item => item.Id != id)

function setId(id) {
  itemId = id;
}

function handleDeleteProducts() {
  console.log(itemId)
  var option = {
    method: "DELETE",
    headers: {
      "Content-Type": "application/json",
    },
  };
  fetch(productsApi + "/" + itemId, option)
    .then(function (response) {
      response.json();
    })
    .then(function () {
      // var productsItem = document.querySelector('.product-item' + id)
      // if(productsItem){
      //   productsItem.remove();
      // }
      location.reload();
    });
}

start();

function handleCreateProducts() {
  var createBtn = document.querySelector("#create");
  createBtn.onclick = function () {
    var name = document.querySelector('input[name="name"]').value;
    var category = document.querySelector('input[category="category"]').value;
    var formData = {
      name: name,
      category: category,
    };
    createProduct(formData, function () {
      getProductions(renderProducts);
    });
  };
}

function createProduct(data, callback) {
  var option = {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(data),
  };
  fetch(productsApi, option)
    .then(function (response) {
      response.json();
    })
    .then(callback);
}

function handleAddForm() {
  var addCateBtn = document.querySelector("#addCategory");

  addCateBtn.onclick = function() {
      var categoryname = document.querySelector(
          'input[name="categoryname"]'
      ).value;
      // console.log(categoryname);
      // alert()
      var FormData = {
          category_name: categoryname,
          category_count: 0,
          isDelete: false,
      };
      addCategories(FormData, function() {
          getCategories(renderCategory);
      });
  };
}

