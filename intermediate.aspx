<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="intermediate.aspx.cs" Inherits="kyubi.intermediate1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Intermediate</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>
    <div class="container">

    <form id="form1" runat="server" style="margin:20px">
        <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Add Question" OnClick="Button1_Click"  />
        <asp:Button ID="Button2" runat="server" CssClass="btn btn-primary" Text="Genrate Text" OnClick="Button2_Click" />
        
        <div id="previoustestdata">
                
        </div>

    </form>
    </div>
   
    
</body>
</html>
