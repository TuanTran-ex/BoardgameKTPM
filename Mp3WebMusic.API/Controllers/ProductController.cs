using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Mp3WebMusic.BAL.INTERFACE;
using Mp3WebMusic.DOMAIN.Model.Product;
using Mp3WebMusic.DOMAIN.Model.Response;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Mp3WebMusic.API.Controllers
{
   
    [ApiController]
    public class ProductController
    {
        
        private readonly IProductService productService;
        public ProductController(IProductService productService)
        {
            this.productService = productService;
        }
        [HttpPost]
        [Route("/api/v1/Product")]
        public Response CreateProduct(Product product)
        {
            return productService.CreateProduct(product);
        }
        [HttpDelete]
        [Route("/api/v1/Product")]
        public Response DeleteProduct(int productId)
        {
            return productService.DeleteProduct(productId);
        }
        [HttpPut]
        [Route("/api/v1/Product")]
        public Response EditProduct(Product product)
        {
            return productService.EditProduct(product);
        }
        [HttpGet]
        [Route("/api/v1/Products")]
        public ResponseList<Product> GetListProduct()
        {
            return productService.GetListProduct();
        }
        [HttpGet]
        [Route("/api/v1/Product/{productId}")]
        public Response GetProductById(int productId)
        {
            return productService.GetProductById(productId);
        }


    }
}

