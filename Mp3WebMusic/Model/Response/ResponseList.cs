using System;
using System.Collections.Generic;
using System.Text;

namespace Mp3WebMusic.DOMAIN.Model.Response
{
    public class ResponseList<T>
    {
        public bool sucess { get; set; }
        public string message { get; set; }

        public List<T> data { get; set; }
    }
}
