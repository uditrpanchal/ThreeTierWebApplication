using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Data;
using CThreeTier.BAL;

namespace CThreeTier.DAL
{
    public class CustomerDAL
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlParameter sprm = new SqlParameter();
        SqlDataAdapter adp;
        DataTable dt;

        public CustomerDAL()
        {
            con = new SqlConnection();
            cmd = new SqlCommand();
            string cnstr = ConfigurationManager.ConnectionStrings["cnstr"].ConnectionString;

            con.ConnectionString = cnstr;
            cmd.Connection = con;
        }

        public DataTable SPGetCustomer(Int64 CustomerID)
        {
            try
            {
                cmd.Parameters.AddWithValue("@CustomerID", CustomerID);
                cmd.CommandText = "SPGetCustomer";
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                //cmd.ExecuteReader();

                dt = new DataTable();
                adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);
                con.Close();
                
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                cmd.Parameters.Clear();
                //cmd.ExecuteReader().Close();
                cmd.Dispose();
                con.Close();
                con.Dispose();
                adp.Dispose();
            }
            return dt;

        }

        public int SPInsertUpdateCustomer(CustomerBAL obj)
        {
            int i, j = 0;
            try
            {
                cmd.Parameters.AddWithValue("@CustomerID", obj.CustomerID);
                cmd.Parameters.AddWithValue("@FirstName", obj.FirstName);
                cmd.Parameters.AddWithValue("@LastName", obj.LastName);
                cmd.Parameters.AddWithValue("@BirthDate", obj.BirthDate);
                cmd.Parameters.AddWithValue("@Email", obj.Email);
                cmd.Parameters.AddWithValue("@Address", obj.Address);

                sprm.Direction = ParameterDirection.ReturnValue;
                cmd.Parameters.Add(sprm);

                

                cmd.CommandText = "SPInsertUpdateCustomer";
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                i = cmd.ExecuteNonQuery();

                if(i > 0)
                {
                    j = int.Parse(sprm.Value.ToString());
                }

                con.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return j;
        }

        public int SPDeleteCustomer(Int64 CustomerID)
        {
            int i = 0;
            try
            {
                cmd.Parameters.AddWithValue("@CustomerID", CustomerID);
                cmd.CommandText = "SPDeleteCustomer";
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                i = cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return i;
        }
    }
}