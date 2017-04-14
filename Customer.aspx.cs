using CThreeTier.BAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CThreeTier
{
    public partial class Customer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindGrid();
            }
        }

        public void BindGrid()
        {
            DataTable dt;
            CustomerBAL obj = new CustomerBAL();
            dt = obj.SPGetCustomer(0);
            obj = null;

            if(dt.Rows.Count > 0)
            {
                divGrid.Visible = true;
                gdCustomer.DataSource = dt;
                gdCustomer.DataBind();
            }
            else
            {
                divGrid.Visible = false;
            }
        }

        public void ClearControls()
        {
            hdnCustomerID.Value = "0";
            txtFirstName.Text = string.Empty;
            txtLastName.Text = string.Empty;
            txtBirthDate.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtAddress.Text = string.Empty;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if(Page.IsValid)
            {
                CustomerBAL obj = new CustomerBAL();
                obj.CustomerID = Convert.ToInt64(hdnCustomerID.Value);
                obj.FirstName = txtFirstName.Text.Trim();
                obj.LastName = txtLastName.Text.Trim();
                obj.BirthDate = DateTime.ParseExact(txtBirthDate.Text.Trim(), "dd/MM/yyyy", null);
                obj.Email = txtEmail.Text.Trim();
                obj.Address = txtAddress.Text.Trim();

                int retVal = obj.SPInsertUpdateCustomer(obj);

                if(retVal > 0)
                {
                    BindGrid();
                    ClearControls();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Saved Successfully", "<script>alert('Saved Successfully');</script>");
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Saved Successfully", "<script>alert('Saved Successfully');</script>");
                }

            }
        }

        protected void gdCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            hdnCustomerID.Value = ((HiddenField)gdCustomer.SelectedRow.FindControl("hdnCustomerID")).Value;
            txtFirstName.Text = ((LinkButton)gdCustomer.SelectedRow.FindControl("lnkFirstName")).Text;
            txtLastName.Text = ((HyperLink)gdCustomer.SelectedRow.FindControl("hypLastName")).Text;
            txtBirthDate.Text = ((Label)gdCustomer.SelectedRow.FindControl("lblBirthDate")).Text;
            txtEmail.Text = ((Label)gdCustomer.SelectedRow.FindControl("lblEmail")).Text;
            txtAddress.Text = ((Label)gdCustomer.SelectedRow.FindControl("lblAddress")).Text;
        }

        protected void gdCustomer_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "EDT")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                gdCustomer.SelectedIndex = rowIndex;
                hdnCustomerID.Value = ((HiddenField)gdCustomer.Rows[rowIndex].FindControl("hdnCustomerID")).Value;
                txtFirstName.Text = ((LinkButton)gdCustomer.Rows[rowIndex].FindControl("lnkFirstName")).Text;
                txtLastName.Text = ((HyperLink)gdCustomer.Rows[rowIndex].FindControl("hypLastName")).Text;
                txtBirthDate.Text = ((Label)gdCustomer.Rows[rowIndex].FindControl("lblBirthDate")).Text;
                txtEmail.Text = ((Label)gdCustomer.Rows[rowIndex].FindControl("lblEmail")).Text;
                txtAddress.Text = ((Label)gdCustomer.Rows[rowIndex].FindControl("lblAddress")).Text;
            }
            else if(e.CommandName == "DLT")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                hdnCustomerID.Value = ((HiddenField)gdCustomer.Rows[rowIndex].FindControl("hdnCustomerID")).Value;
                CustomerBAL obj = new CustomerBAL();
                int retval = obj.SPDeleteCustomer(Convert.ToInt64(hdnCustomerID.Value));
                if(retval > 0)
                {
                    BindGrid();
                    ClearControls();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Deleted Successfully", "<script>alert('Deleted Successfully');</script>");
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Error while deleting", "<script>alert('Error while Deleting');</script>");
                }
            }
        }

        protected void gdCustomer_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[3].BackColor = System.Drawing.Color.Black;
                e.Row.Cells[3].ForeColor = System.Drawing.Color.White;

            }
        }
    }
}