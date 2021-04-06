<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addquestion.aspx.cs" Inherits="kyubi.addquestion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
            
         <div>
            <asp:DropDownList ID="DropDownList1" runat="server">
            </asp:DropDownList>
            <asp:DropDownList ID="DropDownList2" runat="server">
            </asp:DropDownList>
            <asp:DropDownList ID="DropDownList3" runat="server" >
            </asp:DropDownList>
            <br />
        </div>
  
        <div>
            Question<br>
            <asp:TextBox ID="TextBox1" runat="server" Height="78px" Width="281px"></asp:TextBox>
            <br />
            answer<br />
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            option 1<br />
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            option 2<br />
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            option 3<br />
        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        <br />
            Marks<br />
        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        <br />
           <asp:Button ID="Button1" runat="server" Text="add" OnClick="Button1_Click" />
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
