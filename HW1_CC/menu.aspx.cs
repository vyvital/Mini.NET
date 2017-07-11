using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.IO;
using System.Data;


namespace HW1_CC
{
    public partial class menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Err1.Visible = false;
            Err2.Visible = false;
            LB.Visible = false;
            TextBox1.Focus();
            //TextBox1.Text = "cocosce";
            //TextBox2.Text = "us1234";
            //TextBox3.Text = "mypass";
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            if (Validate_user_password(TextBox1.Text, TextBox2.Text, TextBox3.Text)==2)
            {
                DataTable M = new DataTable();
                M = Get("*", "UserDetails WHERE UNAME= '" + TextBox1.Text + "' and UCODE = '" + TextBox2.Text + "' and UPASS = '" + TextBox3.Text + "' ");
                if(M.Rows[0][5].ToString().Equals("1"))
                {
                    Session["user"] = (object)M; 
                    Response.Redirect("UserMenu.aspx");
                }
                else
                {
                    Session["worker"] = (object)M;
                    Response.Redirect("AdminMenu.aspx");
                }

            }
            else if (Validate_user_password(TextBox1.Text, TextBox2.Text, TextBox3.Text) == 1)
            {
                Session["admin"] = (object)Get("*", "AdminUsers WHERE UNAME= '" + TextBox1.Text + "' and UCODE = '" + TextBox2.Text + "' and UPASS = '" + TextBox3.Text + "' ");
                Response.Redirect("AdminMenu.aspx");
            }
            else {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "the user does not exist in our databases,try again" + "');", true);
            }
        }
        

        public  int Validate_user_password(string username, string ucode, string password)
        {
            DataTable T = new DataTable();
            T = Get("*", "AdminUsers WHERE UNAME= '" + username + "' and UCODE = '" + ucode + "' and UPASS = '" + password + "' ");
            if (T.Rows.Count > 0)
                return 1;
            else
            {
                T = new DataTable();
                T = Get("*", "UserDetails WHERE UNAME= '" + username + "' and UCODE = '" + ucode + "' and UPASS = '" + password + "' ");
                if (T.Rows.Count > 0)
                    return 2;
            }
            return 0;
        }


        public  DataTable Get(string fields, string db)
        {
            OleDbConnection conn;
            string str = Server.MapPath("login.accdb");
            string strConn = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + str + ";Persist Security Info=False;";
            conn = new OleDbConnection(strConn);
            DataTable data;
            data = new DataTable();

            try
            {
                conn.Open();
                OleDbCommand dataAdapter = new OleDbCommand("Select " + fields + " FROM " + db + "", conn);
                OleDbDataAdapter excelDataAdapter = new OleDbDataAdapter();
                excelDataAdapter.SelectCommand = dataAdapter;
                excelDataAdapter.Fill(data);
            }

            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

            finally
            {
                conn.Close();
            }

            return data;
        }

        public  void Query(string query)
        {
            OleDbConnection conn;
            string str = Server.MapPath("login.accdb");
            
            string strConn = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source="+str+";Persist Security Info=False;";
            conn = new OleDbConnection(strConn);

            try
            {
                conn.Open();

                OleDbCommand dataAdapter = new OleDbCommand(query, conn);
                dataAdapter.ExecuteNonQuery();
            }

            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

            finally
            {
                conn.Close();
            }
        }

        public  void Insert(string fields, string values)
        {
            Query("INSERT INTO " + fields + " VALUES(" + values + ")");
        }

        public  void Update(string db, string values)
        {
            Query("Update " + db + " Set " + values + "");
        }

        public  void Delete(string db, string values)
        {
            Query("Delete * From " + db + "" + values + "");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["two"] = TextBox1.Text + " " + TextBox2.Text + " " + TextBox3.Text;
            Response.Redirect("UserMenu.aspx");
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            OleDbConnection conn = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0; Data Source=login.accdb ;Persist Security Info=False;");
            DataTable data= new DataTable();
            try
            {
                conn.Open();
                OleDbCommand dataAdapter = new OleDbCommand("Select * FROM AdminUsers", conn);
                OleDbDataAdapter excelDataAdapter = new OleDbDataAdapter();
                excelDataAdapter.SelectCommand = dataAdapter;
                excelDataAdapter.Fill(data);
                
            }
            catch
            {
               
            }
            finally { conn.Close(); }

        
        }

        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
