<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="generator.aspx.cs" Inherits="kyubi.generator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
    <div class="container">

    <form id="form1" runat="server" style="margin-top:20px">

        <div>
            <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server">
            </asp:DropDownList>
            <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server">
            </asp:DropDownList>
            <asp:DropDownList CssClass="form-control" ID="DropDownList3" runat="server" >
            </asp:DropDownList>
            <br />
            <br />
             Name:<asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" ></asp:TextBox>
               <br />
            Marks:-<asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" ></asp:TextBox>
        </div>
        <p>
           <asp:Button ID="Button1" runat="server" Text="Create Test" OnClick="Button1_Click" />
        </p>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </form>
    </div>
    </body>
</html>
