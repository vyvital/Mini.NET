using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
namespace HW1_CC
{
    public partial class UserMenu : System.Web.UI.Page
    {
        DataTable T;
        protected void Page_Load(object sender, EventArgs e)
        {
            T = (DataTable)Session["user"];
            Label6.Text = T.Rows[0][0].ToString();
            Label2.Text = T.Rows[0][1].ToString();
            Label4.Text = T.Rows[0][2].ToString();
            Label8.Text = T.Rows[0][7].ToString();
            Label12.Text = T.Rows[0][3].ToString();
            Label14.Text = T.Rows[0][8].ToString();
            Label10.Text = T.Rows[0][9].ToString();
            Label18.Text = T.Rows[0][6].ToString();
            DataTable C = new DataTable();
            C = Get("CNAME", "Courses where AREA='"+Label10.Text.ToString()+"'");
            for (int i = 0; i < C.Rows.Count; i++)
                ListBox1.Items.Add(C.Rows[i][0].ToString());
            Distinct(ListBox1);
            DataTable CC = new DataTable();
            CC = Get("CNAME", "Courses where SID="+ Convert.ToInt32(Label6.Text));
            Label16.Text = CC.Rows.Count.ToString();

        }

        
        
        public static void Distinct(ListBox list)
        {


            for (int i = 0; i < list.Items.Count; i++)
                for (int j = i + 1; j < list.Items.Count; j++)
                    if (list.Items[i].Text.ToString().ToUpper().Contains(list.Items[j].Text.ToString().ToUpper()))
                        list.Items[j].Text = "Ready to delete";
            for (int i = 0; i < list.Items.Count; i++)
                if (list.Items[i].Text.ToString().Equals("Ready to delete"))
                    list.Items[i].Text = " ";
            int count = list.Items.Count;

            for (int i = count - 1; i >= 0; i--)
                if (list.Items[i].ToString() == " ")
                    list.Items.RemoveAt(i);
        }
        protected void Button1_Click(object sender, EventArgs e)
        {

            try
            {
                Update("UserDetails", "UNAME= '" + TextBox1.Text.ToString() + "' " + "WHERE ID = " + Convert.ToInt32(Label6.Text));
                Label12.Text = TextBox1.Text.ToString();
            }
            catch (Exception ex)
            {
                Response.Write("<script language=javascript>alert('error" + ex.Message.ToString() + "')</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Error, user name was not updated" + ex.Message.ToString() + "\n);", true);
            }
            finally
            {
                filluserinfo();

            }
          
        }
      

      

      

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
               
                Update("UserDetails", "UCODE= '" + TextBox2.Text.ToString() + "' " + "WHERE ID = " + Convert.ToInt32(Label6.Text));
                Label14.Text = TextBox2.Text.ToString();
                //Insert("Courses", "'"+"5"+"','" + TextBox1.Text.ToString() + "','"+ TextBox1.Text.ToString() + "','"+ TextBox1.Text.ToString() + "','"+ TextBox1.Text.ToString()+"'");
            }
            catch (Exception ex)
            {
                Response.Write("<script language=javascript>alert('error" + ex.Message.ToString() + "')</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Error, user code was not updated" + ex.Message.ToString() + "\n);", true);
            }
            finally
            {
                filluserinfo();

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
            string strConn = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + str + ";Persist Security Info=False;";
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

        protected void Button3_Click(object sender, EventArgs e)
        {
        
            
                if (TextBox3.Text == T.Rows[0][4].ToString())
                {
                    Update("UserDetails", "UPASS= '" + TextBox4.Text.ToString() + "' " + "WHERE ID = " + Convert.ToInt32(Label6.Text));
                    Response.Write("<script language=javascript>alert('password updated successfully')</script>");
                }
                else
                    Response.Write("<script language=javascript>alert('error: wrong old password')</script>");
                
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            string str = ListBox1.SelectedItem.Text;
            DataTable CC = new DataTable();
            try
            {
                CC = Get("COST,SYLL", "Courses where CNAME=" + "'" + ListBox1.SelectedItem.Text.ToString() + "'");
                Label30.Text = CC.Rows[0][0].ToString();
                Session["file"] = (object)CC.Rows[0][1].ToString();
            }
            catch { }
        }
        protected  void filluserinfo()
        {
            T = Get("*", "UserDetails where ID="+Label6.Text);
            Label6.Text = T.Rows[0][0].ToString();
            Label2.Text = T.Rows[0][1].ToString();
            Label4.Text = T.Rows[0][2].ToString();
            Label8.Text = T.Rows[0][7].ToString();
            Label12.Text = T.Rows[0][3].ToString();
            Label14.Text = T.Rows[0][8].ToString();
            DataTable C = new DataTable();
            C = Get("CNAME", "Courses");
            for (int i = 0; i < C.Rows.Count; i++)
                ListBox1.Items.Add(C.Rows[i][0].ToString());
            Distinct(ListBox1);            
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("Syll.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (ListBox1.SelectedItem != null)
            {
                DataTable temp = new DataTable();
                bool booli = false;
                temp = Get("CNAME", "Courses where SID=" + Convert.ToInt32(Label6.Text));
                for (int i = 0; i < temp.Rows.Count; i++)
                    if (temp.Rows[i][0].ToString().Equals(ListBox1.SelectedItem.Text))
                        booli = true;
                if (!booli)
                {
                    try
                    {
                        Insert("Courses", "'" + ListBox1.SelectedItem.Text + "','" + Label30.Text + "','" + Label10.Text + "','" + Convert.ToInt32(Label6.Text) + "','" + "Syllabus\\" + ListBox1.SelectedItem.Text + ".txt" + "'");
                        Label16.Text = (Convert.ToInt32(Label16.Text) + 1).ToString();
                        Update("UserDetails", "BILL= '" + (Convert.ToInt32(Label18.Text) + Convert.ToInt32(Label30.Text)).ToString() + "' " + "WHERE ID = " + Convert.ToInt32(Label6.Text));
                        Label18.Text = (Convert.ToInt32(Label18.Text) + Convert.ToInt32(Label30.Text)).ToString();
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script language=javascript>alert('error" + ex.Message.ToString() + "')</script>");
                    }
                }
                else
                    Response.Write("<script language=javascript>alert('error :  you are already registered to this course')</script>");
            }
            else
                Response.Write("<script language=javascript>alert('error :  you must select a course from the list')</script>");

            

        }

    }
}