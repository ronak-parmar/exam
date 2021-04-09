<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addquestion.aspx.cs" Inherits="kyubi.addquestion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Question</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>
    <style>
        .formcontainer{
    width:50%;
    margin: 50px auto;
 
}
    </style>
   <div class="container formcontainer">

    <form id="form1" runat="server">
            
         <div class="form-group">
            <asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server">
            </asp:DropDownList>
            <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server">
            </asp:DropDownList>
            <asp:DropDownList CssClass="form-control" ID="DropDownList3" runat="server" >
            </asp:DropDownList>
            <br />
        </div>
  
        <div>
            <div class="form-group">
            Question<br>
            <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" Height="78px" Width="281px"></asp:TextBox>
           </div>
            answer<br />
            <asp:TextBox  CssClass="form-control" ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            option 1<br />
            <asp:TextBox  CssClass="form-control" ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            option 2<br />
            <asp:TextBox  CssClass="form-control" ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            option 3<br />
        <asp:TextBox  CssClass="form-control" ID="TextBox5" runat="server"></asp:TextBox>
        <br />
            Marks<br />
        <asp:TextBox  CssClass="form-control" ID="TextBox6" runat="server"></asp:TextBox>
        <br />
           <asp:Button ID="Button1" runat="server" Text="add" OnClick="Button1_Click" />
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>
    </form>
   </div> 
</body>
</html>
