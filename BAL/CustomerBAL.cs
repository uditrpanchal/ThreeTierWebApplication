using CThreeTier.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace CThreeTier.BAL
{
    public class CustomerBAL
    {
        public Int64 CustomerID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime BirthDate { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }

        public DataTable SPGetCustomer(Int64 CustomerID)
        {
            CustomerDAL objDAL = new CustomerDAL();
            return objDAL.SPGetCustomer(CustomerID);
        }

        public int SPInsertUpdateCustomer(CustomerBAL obj)
        {
            CustomerDAL objDAL = new CustomerDAL();
            return objDAL.SPInsertUpdateCustomer(obj);

        }

        public int SPDeleteCustomer(Int64 CustomerID)
        {
            CustomerDAL objDAL = new CustomerDAL();
            return objDAL.SPDeleteCustomer(CustomerID);
        }
    }
}