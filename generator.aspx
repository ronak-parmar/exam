<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="generator.aspx.cs" Inherits="kyubi.generator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #Text1 {
            width: 62px;
        }
    </style>
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
            <br />
             Name:<asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox>
               <br />
            Marks:-<asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
        </div>
        <p>
           <asp:Button ID="Button1" runat="server" Text="Create Test" OnClick="Button1_Click" />
        </p>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        .</form>
    </body>
</html>
