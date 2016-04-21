using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AssignmentEC.Models
{
    public class MobileComparePrice : IComparer<MobilePhone>
    {
        public int Compare(MobilePhone a, MobilePhone b)
        {
            int priceA = int.Parse(a.Price.ToString());
            int priceB = int.Parse(b.Price.ToString());
            return priceA.CompareTo(priceB);
        }
    }
}