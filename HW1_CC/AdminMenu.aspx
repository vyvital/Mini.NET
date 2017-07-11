<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminMenu.aspx.cs" Inherits="HW1_CC.AdminMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 903px;
        }
    </style>
</head>
<body style="height: 1174px; width: 1317px">
    <form id="form1" runat="server">
    <div>
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Worker" runat="server" Font-Names="Aharoni" Text="Worker Console"></asp:Label>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Height="20px" OnClick="Button1_Click" Text="Add new user" Width="120px" BackColor="White" BorderColor="#009933" BorderStyle="Groove" ForeColor="#33CC33" />
&nbsp;
        <asp:Button ID="Button2" runat="server" Height="19px" OnClick="Button2_Click" style="margin-left: 0px" Text="Update user" Width="120px" BackColor="White" BorderColor="#009933" BorderStyle="Groove" ForeColor="#33CC33" />
&nbsp;
        <asp:Button ID="Button3" runat="server" Height="20px" OnClick="Button3_Click" Text="Courses activity" Width="120px" BackColor="White" BorderColor="#009933" BorderStyle="Groove" ForeColor="#33CC33" />
    
    </div>
        <asp:Panel ID="Panel1" runat="server" Height="302px">
            <p>
                &nbsp;</p>
            <p>
                &nbsp;<asp:Label ID="Worker0" runat="server" Font-Bold="True" Text="New User"></asp:Label>
            </p>
            <p style="width: 1005px; height: 29px">
                <asp:Label ID="Worker1" runat="server" Text="First name:"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Worker2" runat="server" Text="Last name:"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                &nbsp;&nbsp;
                <asp:Label ID="Worker3" runat="server" Text="ID:"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="TextBox3" ErrorMessage="id must contain 9 digits only" ValidationExpression="[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]"></asp:RegularExpressionValidator>
            </p>
            <p style="width: 1000px">
                <asp:Label ID="Worker4" runat="server" Text="Preffered course area: "></asp:Label>
                <asp:ListBox ID="ListBox1" runat="server" Height="24px"></asp:ListBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Worker5" runat="server" Text="Email: "></asp:Label>
                <asp:TextBox ID="TextBox4" runat="server" Width="240px"></asp:TextBox>
            </p>
            <p style="width: 1185px">
                <asp:Label ID="Worker6" runat="server" Text="Username"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                &nbsp;&nbsp;
                <asp:Label ID="Worker7" runat="server" Text="Usercode"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                &nbsp;&nbsp;
                <asp:Label ID="Worker8" runat="server" Text="Password"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox7" runat="server" Height="22px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox7" ErrorMessage="password must be 7-20 length with small letters,big letters, &amp; special character [  !@#$%^&amp;*()_+   ]" Font-Size="Small" ValidationExpression="^(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&amp;*()_+])[A-Z0-9a-z!@#$%^&amp;*()_+]{7,20}$" ValidationGroup="User name"></asp:RegularExpressionValidator>
            </p>
            <p style="width: 1001px">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox5" ErrorMessage="user name must contain only 5-7 letters" ValidationExpression="[A-Za-z][A-Za-z][A-Za-z][A-Za-z][A-Za-z][A-Za-z]?[A-Za-z]?" ValidationGroup="User name"></asp:RegularExpressionValidator>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox6" ErrorMessage="user code must be 2 letters, then 4 digits" ValidationExpression="[A-Za-z][A-Za-z][0-9][0-9][0-9][0-9]" ValidationGroup="User name"></asp:RegularExpressionValidator>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </p>
            <p style="width: 997px; height: 34px">
                <asp:Label ID="Worker9" runat="server" Text="Role:"></asp:Label>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" Font-Size="Small" Height="16px" RepeatColumns="2" style="margin-left: 183px" Width="158px">
                    <asp:ListItem>Student</asp:ListItem>
                    <asp:ListItem>Worker</asp:ListItem>
                </asp:RadioButtonList>
            </p>
            <p style="width: 994px">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Add User" Width="94px" BackColor="#0099FF" BorderColor="#CC99FF" BorderStyle="Outset" Font-Bold="True" ForeColor="#FF6600" />
                &nbsp;&nbsp;
                <asp:Button ID="Button5" runat="server" Text="Reset Form" Width="94px" OnClick="Button5_Click" BackColor="#0099FF" BorderColor="#CC99FF" BorderStyle="Outset" Font-Bold="True" ForeColor="#FF6600" />
            </p>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" Height="396px">
            <p>
                <asp:Label ID="Worker10" runat="server" Font-Bold="True" Text="Update User"></asp:Label>
            </p>
            <p>
                <asp:Label ID="Label1" runat="server" Text="Select Name:"></asp:Label>
                <asp:ListBox ID="ListBox7" runat="server" Height="24px" AutoPostBack="True" OnSelectedIndexChanged="ListBox7_SelectedIndexChanged"></asp:ListBox>
            </p>
            <p style="width: 714px">
                <asp:Label ID="Worker11" runat="server" Text="First name:"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox8" runat="server" OnTextChanged="TextBox8_TextChanged"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Worker12" runat="server" Text="Last name:"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                &nbsp;&nbsp;
                <asp:Label ID="Worker13" runat="server" Text="ID:"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
            </p>
            <p style="width: 715px">
                <asp:Label ID="Worker14" runat="server" Text="Preffered course area: "></asp:Label>
                <asp:ListBox ID="ListBox2" runat="server" Height="24px"></asp:ListBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Worker15" runat="server" Text="Email: "></asp:Label>
                <asp:TextBox ID="TextBox11" runat="server" Width="240px"></asp:TextBox>
            </p>
            <p>
                <asp:Label ID="Worker16" runat="server" Text="Username"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
                &nbsp;
                <asp:Label ID="Worker17" runat="server" Text="Usercode"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
                &nbsp;
                <asp:Label ID="Worker18" runat="server" Text="Password"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="TextBox7" ErrorMessage="password must be 7-20 length with small letters,big letters, &amp; special character [  !@#$%^&amp;*()_+   ]" Font-Size="Small" ValidationExpression="^(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&amp;*()_+])[A-Z0-9a-z!@#$%^&amp;*()_+]{7,20}$" ValidationGroup="User name"></asp:RegularExpressionValidator>
            </p>
            <p>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="TextBox5" ErrorMessage="user name must contain only 5-7 letters" ValidationExpression="[A-Za-z][A-Za-z][A-Za-z][A-Za-z][A-Za-z][A-Za-z]?[A-Za-z]?" ValidationGroup="User name"></asp:RegularExpressionValidator>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="TextBox6" ErrorMessage="user code must be 2 letters, then 4 digits" ValidationExpression="[A-Za-z][A-Za-z][0-9][0-9][0-9][0-9]" ValidationGroup="User name"></asp:RegularExpressionValidator>
            </p>
            <p style="width: 713px">
                <asp:Label ID="Worker19" runat="server" Text="Role:"></asp:Label>
                <asp:RadioButtonList ID="RadioButtonList2" runat="server" Font-Size="Small" Height="16px" RepeatColumns="2" style="margin-left: 183px" Width="158px">
                    <asp:ListItem>Student</asp:ListItem>
                    <asp:ListItem>Worker</asp:ListItem>
                </asp:RadioButtonList>
            </p>
            <p style="width: 714px; height: 49px;">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button13" runat="server" Height="28px" OnClick="Button13_Click" Text="Update User" Width="91px" BackColor="#0099FF" BorderColor="#CC99FF" BorderStyle="Outset" Font-Bold="True" ForeColor="#FF6600" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button7" runat="server" Height="27px" OnClick="Button7_Click" Text="Reset Form" Width="90px" BackColor="#0099FF" BorderColor="#CC99FF" BorderStyle="Outset" Font-Bold="True" ForeColor="#FF6600" />
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            </p>
        </asp:Panel>
        <asp:Panel ID="Panel3" runat="server" Height="342px">
            <p>
                &nbsp;<asp:Label ID="Worker20" runat="server" Font-Bold="True" Text="Add Course Area"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </p>
           
            <p>
                <asp:Label ID="Worker21" runat="server" Text="Existing areas:"></asp:Label>
                &nbsp;
                <asp:ListBox ID="ListBox3" runat="server" Height="24px" OnSelectedIndexChanged="ListBox3_SelectedIndexChanged"></asp:ListBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Worker22" runat="server" Text="New Area:"></asp:Label>
                &nbsp;
                <asp:TextBox ID="TextBox15" runat="server" OnTextChanged="TextBox15_TextChanged"></asp:TextBox>
                &nbsp;
                <asp:Button ID="Button11" runat="server" OnClick="Button11_Click" Text="Add Area" Width="86px" BackColor="#0099FF" BorderColor="#CC99FF" BorderStyle="Outset" Font-Bold="True" ForeColor="#FF6600" />
            </p>
            <p>
                <asp:Label ID="Worker35" runat="server" Font-Bold="True" Text="Add courses:"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ControlToValidate="TextBox17" ErrorMessage="course price must be integers only" ValidationExpression="[0-9]+" ValidationGroup="User name"></asp:RegularExpressionValidator>
            </p>
            <p>
                <asp:Label ID="Worker24" runat="server" Text="Select Area:"></asp:Label>
                &nbsp;<asp:ListBox ID="ListBox4" runat="server" Height="24px" AutoPostBack="True" OnSelectedIndexChanged="ListBox4_SelectedIndexChanged"></asp:ListBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Worker25" runat="server" Text="Existing courses:"></asp:Label>
                &nbsp;<asp:ListBox ID="ListBox5" runat="server" AutoPostBack="True" Height="27px" style="margin-left: 2px" Width="125px" OnSelectedIndexChanged="ListBox5_SelectedIndexChanged"></asp:ListBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Worker26" runat="server" Text="New Course:"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox16" runat="server" Width="108px"></asp:TextBox>
                &nbsp;
                <asp:Label ID="Worker28" runat="server" Text="Course price:"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox17" runat="server" Width="53px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Worker29" runat="server" Text="Course syllabus:"></asp:Label>
                &nbsp;&nbsp;<asp:FileUpload ID="FileUpload1" runat="server" style="direction: ltr" Width="188px" AllowMultiple="True" BackColor="#FF6600" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button14" runat="server" OnClick="Button14_Click" Text="Add Course" Width="94px" BackColor="#0099FF" BorderColor="#CC99FF" BorderStyle="Outset" Font-Bold="True" ForeColor="#FF6600" />
            </p>
            <p>
                <asp:Label ID="Worker30" runat="server" Font-Bold="True" Text="Student Course Summary"></asp:Label>
                &nbsp;&nbsp;
            </p>
            <p>
                <asp:Label ID="Worker31" runat="server" Text="Select student:"></asp:Label>
                &nbsp;<asp:ListBox ID="ListBox6" runat="server" Height="24px" OnSelectedIndexChanged="ListBox6_SelectedIndexChanged" AutoPostBack="True"></asp:ListBox>
            </p>
            <p>
                <asp:Label ID="Worker32" runat="server" Text="Course Area:"></asp:Label>
                &nbsp;
                <asp:Label ID="Label3" runat="server"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Worker33" runat="server" Text="Number of courses enrolled:"></asp:Label>
                &nbsp;&nbsp;<asp:Label ID="Label4" runat="server"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Worker34" runat="server" Text="Total price:"></asp:Label>
                &nbsp;<asp:Label ID="Label5" runat="server"></asp:Label>
            </p>
        </asp:Panel>
    </form>
</body>
</html>
