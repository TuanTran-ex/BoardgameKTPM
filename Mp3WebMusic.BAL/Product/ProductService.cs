using Mp3WebMusic.BAL.INTERFACE;

using Mp3WebMusic.DAL.INTERFACE;

using Mp3WebMusic.DOMAIN.Model.Product;
using Mp3WebMusic.DOMAIN.Model.Response;

using System;
using System.Collections.Generic;

namespace Mp3WebMusic.BAL.Songs
{
    public class ProductService : IProductService
    {
        private IProductRepository productRepository;
        public ProductService(IProductRepository productRepository)
        {
            this.productRepository = productRepository;
        }

        public Response CreateProduct(Product product)
        {
            return productRepository.CreateProduct(product);
        }

        public Response DeleteProduct(int productId)
        {
            return productRepository.DeleteProduct(productId);
        }

        public Response EditProduct(Product product)
        {
            return productRepository.EditProduct(product);
        }

        public ResponseList<Product> GetListProduct()
        {
            return productRepository.GetListProduct();
        }

        public Response GetProductById(int productId)
        {
            return productRepository.GetProductById(productId);
        }
    }
}
