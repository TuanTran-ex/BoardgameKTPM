using Mp3WebMusic.DOMAIN.Model.Product;
using Mp3WebMusic.DOMAIN.Model.Response;

using System.Collections.Generic;

namespace Mp3WebMusic.DAL.INTERFACE
{
    public interface IProductRepository
    {
        ResponseList<Product> GetListProduct();

        Response GetProductById(int productId);
        Response CreateProduct(Product product);
        Response DeleteProduct(int productId);
        Response EditProduct(Product product);

    }
}
