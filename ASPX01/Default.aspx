<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ASPX01.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Prima Pagina ASPX</title>
</head>
<body>
    <h1>5 INF B - ASPX</h1>
    <form id="form1" runat="server">
        <h5>Filtra per classe:
            <asp:DropDownList ID="cmbClasse" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cmbClasse_SelectedIndexChanged"></asp:DropDownList>
        </h5>
        <%--<div>
            <!-- <% Response.Write("<b> Pagina di registrazione </b>");%> <br /> -->
            UserName <asp:TextBox ID="txtUserName" runat="server"/> <br />
            Password <input type="text" id="txtPassword"/> <br />
            <asp:Button ID="btnInvia" runat="server" Text="Invia" /> <br />
            <asp:Label ID="lblMessaggio" runat="server" Text=" "> </asp:Label>
        </div>--%>
        <asp:GridView ID="gridStudenti" runat="server"></asp:GridView>
    </form>
</body>
</html>
