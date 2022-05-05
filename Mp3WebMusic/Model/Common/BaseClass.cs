using System;
using System.Collections.Generic;
using System.Text;

namespace Mp3WebMusic.DOMAIN.Model.Common
{
    public class BaseClass
    {
        public int Id { get; set; }
        public bool IsDelete { get; set; }

        public DateTime CreatedAt { get; set; }
        public  int CreatedBy { get; set; }

        public DateTime UpdatedAt { get; set; }
        public int UpdatedBy { get; set; }
    }
}
