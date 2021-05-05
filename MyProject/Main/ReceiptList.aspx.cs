using CoreProject.Managers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Main
{
    public partial class Invoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //找出MasterPage中的Label控制項並給與當前表單名稱
            MainMaster masterPage = this.Master as MainMaster;
            Label label = masterPage.FindControl("lbPageName") as Label;
            label.Text = "發票清單";

            var manager = new ReceiptManager();
            var list = manager.GetInvoices();
            this.repInvoice.DataSource = list;
            this.repInvoice.DataBind();
        }
    }
}