using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using Mp3WebMusic.DOMAIN;
namespace Mp3WebMusic.DAL
{
    public class BaseRepository
    {
        protected IDbConnection connection;
        public BaseRepository()
        {
            string connectionString = Common.ConnectionString;
            connection = new SqlConnection(connectionString);
      
        }
    }
}
