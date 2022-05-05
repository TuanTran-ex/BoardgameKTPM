using Mp3WebMusic.DOMAIN.Model.Common;
using System;
using System.Collections.Generic;
using System.Text;

namespace Mp3WebMusic.DOMAIN.Model.Product
{
    public class Product : BaseClass
    {

        public string Name { get; set; }
        public string Players { get; set; }
        public int PlayersSuggest { get; set; }
        public int AgeSuggest { get; set; }
        public string Time { get; set; }
        public int CategoryId { get; set; }
        public string MainImage { get; set; }
        public string ShortDesc { get; set; }
        public string Description { get; set; }
        public float Price { get; set; }
        public string Brand { get; set; }
        public string Origin { get; set; }
        public float Weight { get; set; }
        public string Size { get; set; }

    }
}
