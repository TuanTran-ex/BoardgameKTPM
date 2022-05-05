using System;
using System.Collections.Generic;
using System.Text;

namespace Mp3WebMusic.DOMAIN.Model.Response
{
    public class Response
    {
        public bool sucess { get; set; }
        public string message { get; set; }

        public object data { get; set; }
    }
}
