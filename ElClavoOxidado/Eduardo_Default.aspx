<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Eduardo_Default.aspx.vb" Inherits="Eduardo_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <title></title>
    <script type="text/javascript" src="sha.js"></script>
    <script type="text/javascript">
    function getHash(form) {
        var hashInput = document.getElementById("pass");
        var hash = new jsSHA(hashInput.value, "TEXT");
        var hashOutput = document.getElementById("pass");
        hashOutput.value = hash.getHash("SHA-256", "HEX");
        form.submit();
    }
    </script>
</head>
<body>
    <form id="form1" method = post action = "Eduardo_Login">
        <%--<asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtPass" runat="server"></asp:TextBox>
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClientClick="getHash(form1)"/>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>  --%>
     
        <input type ="text" name="txtUser" id="user" ></input>
        <input type ="password" name="txtPass" id="pass" ></input>
        <input type ="button" name="btnLogin"  value="Login" onclick="javascript:getHash(form1)"/>  
        <input type="text" name="resultado" id="resultado" size="100"></input>
    <div></div>
    </form>
</body>
</html>
