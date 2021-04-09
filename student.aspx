<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student.aspx.cs" Inherits="kyubi.student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <style>
        .trtag:hover{
            background-color:aquamarine;
        }
    </style>
    <form id="form1" runat="server">
        <div>
        <table style="width: 50%; text-align: center; background-color: skyblue;">  
            <tr>  
                <td align="center">  
                    <asp:PlaceHolder ID="DBDataPlaceHolder" runat="server"></asp:PlaceHolder>  
                </td>  
            </tr>  
        </table> 
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </div>
    </form>

    <script>
        function attempttest(id) {
            console.log(id)
            localStorage.clear()
            localStorage.setItem("questionidlist", id)
            window.location.href = "https://localhost:44366/test";
        }
    </script>

</body>
</html>
