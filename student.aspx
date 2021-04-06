<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student.aspx.cs" Inherits="kyubi.student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <table style="width: 50%; text-align: center; background-color: skyblue;">  
            <tr>  
                <td align="center">  
                    <asp:PlaceHolder ID="DBDataPlaceHolder" runat="server"></asp:PlaceHolder>  
                </td>  
            </tr>  
        </table> 
        </div>
    </form>
</body>
</html>
