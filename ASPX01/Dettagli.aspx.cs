using ASPX01.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASPX01
{
    public partial class Dettagli : System.Web.UI.Page
    {
        DbTools db;
        DataTable table;
        int index = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            string cogn = Request.QueryString["cognome"];
            string sql = "SELECT Cognome, Nome, Classe, Genere, AnnoNascita FROM Studenti, Classi WHERE Studenti.IdClasse=Classi.Id";
            sql += " AND Cognome='" + cogn + "'";
            string dbPath = Server.MapPath("App_Data/Studenti.mdf");
            string connStr = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=" +
                dbPath + ";Integrated Security=True;Connect Timeout=30";
            db = new DbTools(connStr);
            table = db.GetDataTable(sql);
            if (table.Rows.Count > 0)
            {
                assignData();
                if (table.Rows.Count > 1) pnlPrevNext.Visible = true;
            }
            else
            {
                pnlData.Visible = false;
                pnlNotFound.Visible = true;
            }
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnPrev_Click(object sender, EventArgs e)
        {

        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            index++;
            assignData();
            btnPrev.Enabled = true;
            if (index == table.Rows.Count - 1) btnNext.Enabled = false;
        }

        protected void assignData()
        {
            lblNome.Text = table.Rows[index]["Nome"].ToString();
            lblCognome.Text = table.Rows[index]["Cognome"].ToString();
            lblClasse.Text = table.Rows[index]["Classe"].ToString();
            lblGenere.Text = table.Rows[index]["Genere"].ToString();
            lblAnnoNascita.Text = table.Rows[index]["AnnoNascita"].ToString();
        }
    }
}