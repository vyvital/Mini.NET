using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using System.IO;


namespace HW1_CC
{
    public partial class testacc : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string str = Server.MapPath(Session["file"].ToString());
                StreamReader reader = File.OpenText(str);
                TextBox1.Text = reader.ReadToEnd();
                reader.Close();
            }
           catch
           {            
               Response.Write("<script language=javascript>alert('error:could not open syllabus file... press back and try again')</script>");
           }
        }
    }
}