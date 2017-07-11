<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserMenu.aspx.cs" Inherits="HW1_CC.UserMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:Panel ID="Panel1" runat="server" Height="316px">
            <asp:Label ID="Label1" runat="server" Text="First name:"></asp:Label>
            &nbsp;
            <asp:Label ID="Label2" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Text="Last name:"></asp:Label>
            &nbsp;
            <asp:Label ID="Label4" runat="server"></asp:Label>
            &nbsp;
            <asp:Label ID="Label5" runat="server" Text="ID:"></asp:Label>
            &nbsp;<asp:Label ID="Label6" runat="server"></asp:Label>
            <br />
            <asp:Label ID="Label7" runat="server" Text="Email:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label8" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label9" runat="server" Text="Course area: "></asp:Label>
            &nbsp;<asp:Label ID="Label10" runat="server"></asp:Label>
            <br />
            <asp:Label ID="Label11" runat="server" Text="User name:"></asp:Label>
            &nbsp;
            <asp:Label ID="Label12" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label13" runat="server" Text="User code: "></asp:Label>
            &nbsp;&nbsp;
            <asp:Label ID="Label14" runat="server"></asp:Label>
            <br />
            <asp:Label ID="Label15" runat="server" Text="Total courses:"></asp:Label>
            &nbsp;
            <asp:Label ID="Label16" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label17" runat="server" Text="Total price:"></asp:Label>
            &nbsp;&nbsp;
            <asp:Label ID="Label18" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label19" runat="server" Text="Change Username"></asp:Label>
            <br />
            <asp:Label ID="Label20" runat="server" Text="New username: "></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Change" BackColor="#3366FF" ForeColor="#FFCC66" />
            &nbsp;&nbsp;
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="user name must contain only 5-7 letters" ValidationExpression="[A-Za-z][A-Za-z][A-Za-z][A-Za-z][A-Za-z][A-Za-z]?[A-Za-z]?" ValidationGroup="User name"></asp:RegularExpressionValidator>
            <br />
            <asp:Label ID="Label21" runat="server" Text="Change user code"></asp:Label>
            <br />
            <asp:Label ID="Label22" runat="server" Text="New user code: "></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:Button ID="Button2" runat="server" Text="Change" OnClick="Button2_Click" BackColor="#3366FF" ForeColor="#FFCC66" />
            &nbsp;
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="user code must be 2 letters, then 4 digits" ValidationExpression="[A-Za-z][A-Za-z][0-9][0-9][0-9][0-9]" ValidationGroup="User name"></asp:RegularExpressionValidator>
            <br />
            <asp:Label ID="Label23" runat="server" Text="Change user password"></asp:Label>
            <br />
            <asp:Label ID="Label24" runat="server" Text="Old password: "></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <asp:Label ID="Label25" runat="server" Text="New password: "></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Change" BackColor="#3366FF" ForeColor="#FFCC66" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox4" ErrorMessage="password must be 7-20 length with small letters,big letters, &amp; special character [  !@#$%^&amp;*()_+   ]" Font-Size="Small" ValidationExpression="^(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&amp;*()_+])[A-Z0-9a-z!@#$%^&amp;*()_+]{7,20}$" ValidationGroup="User name"></asp:RegularExpressionValidator>
            <br />
            <asp:Label ID="Label26" runat="server" Text="Course registration: "></asp:Label>
            <br />
            <asp:Label ID="Label27" runat="server" Text="Course name:"></asp:Label>
            <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" Height="23px" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"></asp:ListBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label28" runat="server" Text="Course syllabus: "></asp:Label>
            &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">read File</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label29" runat="server" Text="Price: "></asp:Label>
            <asp:Label ID="Label30" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Button ID="Button4" runat="server" Text="Register" OnClick="Button4_Click" BackColor="#3366FF" ForeColor="#FFCC66" />
        </asp:Panel>
    </form>
</body>
</html>
