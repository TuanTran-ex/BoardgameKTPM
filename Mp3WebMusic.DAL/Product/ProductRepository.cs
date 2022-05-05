using Dapper;
using Mp3WebMusic.DAL.INTERFACE;
using Mp3WebMusic.DOMAIN.Model.Product;
using Mp3WebMusic.DOMAIN.Model.Response;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace Mp3WebMusic.DAL.Songs
{
    public class ProductRepository : BaseRepository, IProductRepository
    {
        public ResponseList<Product> GetListProduct()
        {
         
            IList<Product> Products = SqlMapper.Query<Product>(connection, "Product_GetList",  commandType: CommandType.StoredProcedure).ToList();
            var response = new ResponseList<Product>()
            {
                message = "OK",
                sucess = true,
                data = (List<Product>)Products
            };
            return response;
        }
        public Response GetProductById(int Productid)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("@Id", Productid);
            Product Product = SqlMapper.Query<Product>(connection, "Product_Get", parameters, commandType: CommandType.StoredProcedure).FirstOrDefault();
            var response = new Response()
            {
                message = "OK",
                sucess = true,
                data = Product
            };
            return response;
        }
        public Response CreateProduct(Product request)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@Name", request.Name);
                parameters.Add("@Players", request.Players);
                parameters.Add("@PlayersSuggest", request.PlayersSuggest);
                parameters.Add("@Time", request.Time);
                parameters.Add("@AgeSuggest", request.AgeSuggest);
                parameters.Add("@CategoryId", request.CategoryId);
                parameters.Add("@MainImage", request.MainImage);
                parameters.Add("@ShortDesc", request.ShortDesc);
                parameters.Add("@Description", request.Description);
                parameters.Add("@Price", request.Price);
                parameters.Add("@Brand", request.Brand);
                parameters.Add("@Origin", request.Origin);
                parameters.Add("@Weight", request.Weight);
                parameters.Add("@Size", request.Size);
                parameters.Add("@CreatedBy", request.CreatedBy);
                var model = SqlMapper.QueryFirstOrDefault<Product>(connection, "Product_Create", parameters, commandType: CommandType.StoredProcedure);
                var response = new Response()
                {
                    message = "OK",
                    sucess = true,
                    data = model
                };
                return response;
            }
            catch (Exception e)
            {
                return new Response()
                {
                   sucess = false,
                   message = e.Message,
                   data = null,
                };
            }
        }
        public Response DeleteProduct(int request)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@Id", request);
                var model = SqlMapper.QueryFirstOrDefault<Product>(connection, "Product_Delete", parameters, commandType: CommandType.StoredProcedure);
                var response = new Response()
                {
                    message = "OK",
                    sucess = true,
                    data = model
                };
                return response;
            }
            catch (Exception e)
            {
                return new Response()
                {
                    sucess = false,
                    message = e.Message,
                    data = null,
                };
            }
        }
        public Response EditProduct(Product request)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@Id", request.Id);
                parameters.Add("@Name", request.Name);
                parameters.Add("@Players", request.Players);
                parameters.Add("@PlayersSuggest", request.PlayersSuggest);
                parameters.Add("@Time", request.Time);
                parameters.Add("@AgeSuggest", request.AgeSuggest);
                parameters.Add("@CategoryId", request.CategoryId);
                parameters.Add("@MainImage", request.MainImage);
                parameters.Add("@ShortDesc", request.ShortDesc);
                parameters.Add("@Description", request.Description);
                parameters.Add("@Price", request.Price);
                parameters.Add("@Brand", request.Brand);
                parameters.Add("@Origin", request.Origin);
                parameters.Add("@Weight", request.Weight);
                parameters.Add("@Size", request.Size);
                parameters.Add("@UpdateBy", request.UpdatedBy);
                var model = SqlMapper.QueryFirstOrDefault<Product>(connection, "Product_Edit", parameters, commandType: CommandType.StoredProcedure);
                var response = new Response()
                {
                    message = "OK",
                    sucess = true,
                    data = model
                };
                return response;
            }
            catch (Exception e)
            {
            
                 return new Response()
                 {
                     sucess = false,
                     message = e.Message,
                     data = null,
                 };
            }
        }

    }

}
