<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ASPX01.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Prima Pagina ASPX</title>
</head>
<body>
    <h1>5 INF B - ASPX</h1>
    <p>USER AGENT: <asp:Label ID="lblUserAgent" runat="server" Text=""></asp:Label></p>
    <p>CONTATORE VISITE: <asp:Label ID="lblCounter" runat="server" Text=""></asp:Label></p>
    <p>UTENTE ONLINE DALLE <asp:Label ID="lblConnectionTime" runat="server" Text=""></asp:Label></p>
    <form id="form1" runat="server">
        <%--<div>
            <!-- <% Response.Write("<b> Pagina di registrazione </b>");%> <br /> -->
            UserName <asp:TextBox ID="txtUserName" runat="server"/> <br />
            Password <input type="text" id="txtPassword"/> <br />
            <asp:Button ID="btnInvia" runat="server" Text="Invia" /> <br />
            <asp:Label ID="lblMessaggio" runat="server" Text=" "> </asp:Label>
        </div>--%>
        <h5>Filtra per classe:
            <asp:DropDownList ID="cmbClasse" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cmbClasse_SelectedIndexChanged"></asp:DropDownList>
        </h5>
        <h5>
            Filtra per genere:
            <asp:RadioButton ID="rbMale" runat="server" Text="M" GroupName="gender" OnCheckedChanged="rbGender_CheckedChanged" AutoPostBack="true" />
            &nbsp;&nbsp;
            <asp:RadioButton ID="rbFemale" runat="server" Text="F" GroupName="gender" OnCheckedChanged="rbGender_CheckedChanged" AutoPostBack="true" />
            &nbsp;&nbsp;
            <asp:RadioButton ID="rbAll" runat="server" Text="ALL" GroupName="gender" Checked="true" OnCheckedChanged="rbGender_CheckedChanged" AutoPostBack="true" />
        </h5>
        <h5>
            Filtra per cognome:
            <asp:TextBox ID="txtCognome" runat="server"></asp:TextBox>
            &nbsp;&nbsp;
            <asp:Button ID="btnCerca" runat="server" Text="Visualizza Dettagli" OnClick="btnCerca_Click" />
        </h5>
        <asp:GridView ID="gridStudenti" runat="server"></asp:GridView>
    </form>
</body>
</html>
