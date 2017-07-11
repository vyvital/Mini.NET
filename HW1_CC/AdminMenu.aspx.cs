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
    public partial class AdminMenu : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Panel2.Visible = false;
            Panel3.Visible = false;
            Label2.Visible = false;
            Page.Form.Attributes.Add("enctype", "multipart/form-data");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {

            DataTable check = new DataTable();
            bool boolim = false;
            check = Get("UNAME,ID", "UserDetails");
            for (int i = 0; i < check.Rows.Count;i++ )
                if (check.Rows[i][0].ToString().Equals(TextBox5.Text) || check.Rows[i][1].ToString().Equals(TextBox3.Text))
                    boolim=true;
            if(!boolim)
            {
                try
                {
                    if (RadioButtonList1.Items[0].Selected)
                        Insert("UserDetails", "'" + Convert.ToInt32(TextBox3.Text) + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "','" + TextBox7.Text + "','" + 1.ToString() + "','" + "0" + "','" + TextBox4.Text + "','" + TextBox6.Text + "','" + ListBox1.SelectedItem.Text + "'");
                    else if (RadioButtonList1.Items[1].Selected)
                        Insert("UserDetails", "'" + Convert.ToInt32(TextBox3.Text) + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox5.Text + "','" + TextBox7.Text + "','" + 2.ToString() + "','" + "0" + "','" + TextBox4.Text + "','" + TextBox6.Text + "','" + ListBox1.SelectedItem.Text + "'");


                    if (Session["admin"] != null && RadioButtonList1.Items[1].Selected)
                        Delete("AdminUsers", "");
                    Response.Write("<script language=javascript>alert('user added successfully')</script>");

                }
                catch (Exception ex)
                {
                    Response.Write("<script language=javascript>alert('error" + ex.Message.ToString() + "')</script>");
                }
            }
            else
                Response.Write("<script language=javascript>alert('error: user already exist')</script>");
            Panel1.Visible = true;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Panel2.Visible = false;
            Panel3.Visible = false;
            DataTable Z = new DataTable();
            Z = Get("AREA", "Courses");
            for (int i = 0; i < Z.Rows.Count; i++)
                ListBox1.Items.Add(Z.Rows[i][0].ToString());
            Distinct(ListBox1);
            Panel1.Visible = true;


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Panel3.Visible = false;
            Panel1.Visible = false;
            DataTable T = new DataTable();
            DataTable A = new DataTable();
            T = Get("*", "UserDetails ");
            A = Get("AREA", "Courses");
            for (int i = 0; i < A.Rows.Count; i++)
                ListBox2.Items.Add(A.Rows[i][0].ToString());
            for (int i = 0; i < T.Rows.Count; i++)
                ListBox7.Items.Add(T.Rows[i][0].ToString() + "  " + T.Rows[i][1].ToString() + "  " + T.Rows[i][2].ToString() + "");
            Distinct(ListBox7);
            Distinct(ListBox2);
            Panel2.Visible = true;
           

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Panel2.Visible = false;
            DataTable T = new DataTable();
            DataTable A = new DataTable();
            DataTable C = new DataTable();
            T = Get("ID,FIRSTNAME,LASTNAME", "UserDetails where PERMISSION='"+1.ToString()+"'");
            A = Get("ANAME", "Area");
            for (int i = 0; i < T.Rows.Count; i++)
                ListBox6.Items.Add(T.Rows[i][0].ToString() + "  " + T.Rows[i][1].ToString() + "  " + T.Rows[i][2].ToString() + "");
            for (int i = 0; i < A.Rows.Count; i++)
                ListBox3.Items.Add(A.Rows[i][0].ToString());
            
            for (int i = 0; i < A.Rows.Count; i++)
                ListBox4.Items.Add(A.Rows[i][0].ToString());
            Distinct(ListBox3);
            Distinct(ListBox4);
            Distinct(ListBox6);
            Panel3.Visible = true;
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            RadioButtonList1.Items[0].Selected = false;
            RadioButtonList1.Items[1].Selected = false;
            ListBox1.SelectedItem.Selected = false;
            Panel1.Visible = true;
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
        public  void Delete(string db, string values)
        {
            Query("Delete * From " + db + "" + values + "");
        }
        public  void Insert(string fields, string values)
        {
            Query("INSERT INTO " + fields + " VALUES(" + values + ")");
        }
        public  void Update(string db, string values)
        {
            Query("Update " + db + " Set " + values + "");
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

        protected void Button7_Click(object sender, EventArgs e)
        {
            TextBox8.Text = "";
            TextBox9.Text = "";
            TextBox10.Text = "";
            TextBox11.Text = "";
            TextBox12.Text = "";
            TextBox13.Text = "";
            TextBox14.Text = "";
            RadioButtonList2.Items[0].Selected = false;
            RadioButtonList2.Items[1].Selected = false;
            try
            {
                ListBox7.SelectedItem.Selected = false;
                ListBox2.SelectedItem.Selected = false;
            }
            catch { }
            Panel2.Visible = true;
        }
        protected void Button8_Click(object sender, EventArgs e)
        {
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            bool B = false;
            TextBox15.Text = TextBox15.Text.Trim();
            for (int i = 0; i < ListBox3.Items.Count; i++)
                if (ListBox3.Items[i].Text.ToString().ToUpper().Equals(TextBox15.Text.ToString().ToUpper()))
                    B = true;
            if (!B && (!string.IsNullOrWhiteSpace(TextBox15.Text) && !string.IsNullOrEmpty(TextBox15.Text)))
            {
                Insert("Area", "'" + TextBox15.Text + "'");
                Response.Write("<script language=javascript>alert('Area added successfully')</script>");

            }
            else
                Response.Write("<script language=javascript>alert('Error : Area Not added, check requirements')</script>");
            Panel3.Visible = true;
        }

        public void ListBox6_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable Z = new DataTable();
            Z = Get("*", "UserDetails where ID=" + Convert.ToInt32(ListBox6.SelectedItem.Text.Remove(10)) );
            Label5.Text = Z.Rows[0][6].ToString();
            Label3.Text = Z.Rows[0][9].ToString();
            Z = Get("*", "Courses where SID=" + Convert.ToInt32(ListBox6.SelectedItem.Text.Remove(10)) );
            Label4.Text = Z.Rows.Count.ToString();
            Panel3.Visible = true; 
        }

        
        protected void Button13_Click(object sender, EventArgs e)
        {
            if (ListBox2.SelectedItem!=null && ListBox7.SelectedItem!=null)
            {
                try
                {

                    Update("UserDetails", "ID='" + TextBox10.Text + "',FIRSTNAME='" + TextBox8.Text + "',LASTNAME='" + TextBox9.Text + "',UNAME='" + TextBox12.Text + "',UPASS='" + TextBox14.Text + "',PERMISSION='" + (RadioButtonList2.SelectedIndex + 1).ToString() + "',BILL='" + Label2.Text + "',EMAIL='" + TextBox11.Text + "',UCODE='" + TextBox13.Text + "',AREA='" + ListBox2.SelectedItem.Text + "'" + "WHERE ID ="
                        + Convert.ToInt32(TextBox10.Text));
                    Response.Write("<script language=javascript>alert('updated successfully')</script>");

                }
                catch (Exception ex)
                {
                    Response.Write("<script language=javascript>alert('error you must select all fields '" + ex.Message + "')</script>");
                }
            }
            else
                Response.Write("<script language=javascript>alert('error you must fill all fields ')</script>");

             Panel2.Visible = true;
        }

        protected void ListBox7_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable TT = Get("*", "UserDetails where ID=" + ListBox7.SelectedItem.Text.Remove(10));
            TextBox10.Text = TT.Rows[0][0].ToString();
            TextBox8.Text = TT.Rows[0][1].ToString();
            TextBox9.Text = TT.Rows[0][2].ToString();
            TextBox11.Text = TT.Rows[0][7].ToString();
            TextBox12.Text = TT.Rows[0][3].ToString();
            TextBox13.Text = TT.Rows[0][8].ToString();
            TextBox14.Text = TT.Rows[0][4].ToString();
            Label2.Text = TT.Rows[0][6].ToString();
            if (TT.Rows[0][5].ToString() == "1")
                RadioButtonList2.Items[0].Selected = true;
            else
                RadioButtonList2.Items[1].Selected = true;
            Panel2.Visible = true;
            TextBox10.Enabled = false;
            TextBox12.Enabled = false;
            TextBox13.Enabled = false;


        }
        protected void TextBox8_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ListBox3_SelectedIndexChanged(object sender, EventArgs e)
        {
            Panel3.Visible = true;
        }

        protected void TextBox15_TextChanged(object sender, EventArgs e)
        {
        }

        protected void ListBox4_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            DataTable temp = Get("CNAME", "Courses where AREA='" + ListBox4.SelectedItem.Text.ToString()+"'");
            while (ListBox5.Items.Count > 0)
                ListBox5.Items.Remove(ListBox5.Items[0]);
            for (int i = 0; i < temp.Rows.Count; i++)
                ListBox5.Items.Add(temp.Rows[i][0].ToString());
            Distinct(ListBox5);
            Panel3.Visible = true;

        }

        protected void Button14_Click(object sender, EventArgs e)
        {

           
                bool BB=false;
                for(int i=0;i<ListBox5.Items.Count;i++)
                    if(TextBox16.Text.Equals(ListBox5.Items[i].Text))
                        BB=true;
                try
                {
                    string FN = FileUpload1.FileName;
                    if (!BB)
                    {
                        if (!string.IsNullOrEmpty(FN))
                        {
                            FileUpload1.SaveAs(Server.MapPath("Syllabus/"+FN));
                            Insert("Courses", "'" + TextBox16.Text + "','" + TextBox17.Text + "','" + ListBox4.SelectedItem.Text + "','" + 1 + "','" + "Syllabus/" + FN + "'");
                       }
                       else 
                           Insert("Courses", "'" + TextBox16.Text + "','" + TextBox17.Text + "','" + ListBox4.SelectedItem.Text + "','" + 1 + "','" + "no course syllabus"+"'");

                    }
                    else
                        Response.Write("<script language=javascript>alert('error: course already exist, make sure you fill all fields')</script>");

                }
                catch(Exception ex)
                {
                    Response.Write("<script language=javascript>alert('error: "+ex.Message+"')</script>");
                }
                DataTable temp = Get("CNAME", "Courses where AREA='" + ListBox4.SelectedItem.Text.ToString() + "'");
                while (ListBox5.Items.Count > 0)
                    ListBox5.Items.Remove(ListBox5.Items[0]);
                for (int i = 0; i < temp.Rows.Count; i++)
                    ListBox5.Items.Add(temp.Rows[i][0].ToString());
                Distinct(ListBox5);
                Panel3.Visible = true;
        }

        protected void ListBox5_SelectedIndexChanged(object sender, EventArgs e)
        {
            Panel3.Visible = true;

        }
    }
}