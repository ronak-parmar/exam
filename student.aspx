<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student.aspx.cs" Inherits="kyubi.student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>
    <style>
        .trtag:hover{
            background-color:aquamarine;
        }
        
    </style>
    <div class="container">

    <form id="form1" runat="server">
        <div>
        <table style="width: 50%; text-align: center;>  
            <tr>  
                <td align="center">  
                    <asp:PlaceHolder ID="DBDataPlaceHolder" runat="server"></asp:PlaceHolder>  
                </td>  
            </tr>  
        </table> 
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>
    </form>
    </div>

    <script>
        function attempttest(id,tsetid) {
            
            localStorage.clear()
            localStorage.setItem("questionidlist", id)
            localStorage.setItem("tsetid", tsetid)
            window.location.href = "https://localhost:44366/test";
        }
    </script>

</body>
</html>
