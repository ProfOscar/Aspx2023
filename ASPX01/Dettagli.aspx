<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dettagli.aspx.cs" Inherits="ASPX01.Dettagli" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Dettagli Studente</title>
</head>
<body>
    <h1>Dettagli Studente</h1>
    <form id="form1" runat="server">
        <asp:Panel ID="pnlData" runat="server" Visible="true">
            <div>
                Nome: <asp:Label ID="lblNome" runat="server" Text=""></asp:Label>
                <br />
                Cognome: <asp:Label ID="lblCognome" runat="server" Text=""></asp:Label>
                <br />
                Genere: <asp:Label ID="lblGenere" runat="server" Text=""></asp:Label>
                <br />
                Classe: <asp:Label ID="lblClasse" runat="server" Text=""></asp:Label>
                <br />
                Anno di Nascita: <asp:Label ID="lblAnnoNascita" runat="server" Text=""></asp:Label>
                <br />
                <br />
            </div>
        </asp:Panel>
        <asp:Panel ID="pnlNotFound" runat="server" Visible="false">
            <h5>STUDENTE NON TROVATO</h5>
        </asp:Panel>
        <asp:Panel ID="pnlPrevNext" runat="server" Visible="false">
            <asp:Button ID="btnPrev" runat="server" Text="PREVIOUS" OnClick="btnPrev_Click" onclientclick="Javascript:return false;" Enabled="false" />
            <asp:Button ID="btnNext" runat="server" Text="NEXT" OnClick="btnNext_Click" CausesValidation="false" />
        </asp:Panel>
        <p></p>
        <asp:Button ID="btnHome" runat="server" Text="HOMEPAGE" OnClick="btnHome_Click" />
    </form>
</body>
</html>
