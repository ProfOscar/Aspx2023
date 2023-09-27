using ASPX01.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASPX01
{
    public partial class Default : System.Web.UI.Page
    {
        DbTools db;
        protected void Page_Load(object sender, EventArgs e)
        {
            // lblMessaggio.Text = "Benvenuto " + txtUserName.Text;

            string dbPath = Server.MapPath("App_Data/Studenti.mdf");
            string connStr = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=" +
                dbPath + ";Integrated Security=True;Connect Timeout=30";
            db = new DbTools(connStr);

            if (!Page.IsPostBack)   // al primo avvio della webapp
            {
                // RIEMPIO LA COMBO
                cmbClasse.DataSource = db.GetDataTable("SELECT * FROM Classi ORDER BY Classe");
                cmbClasse.DataTextField = "Classe";
                cmbClasse.DataValueField = "Id";
                cmbClasse.DataBind();
                cmbClasse.Items.Insert(0, "(tutte)");

                // RIEMPIO LA GRIGLIA
                string sql = "SELECT Cognome, Nome, Classe, Genere, AnnoNascita FROM Studenti, Classi " +
                    "WHERE Studenti.IdClasse=Classi.Id";
                gridStudenti.DataSource = db.GetDataTable(sql);
                gridStudenti.DataBind();

            }
        }

        protected void cmbClasse_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sql = "SELECT Cognome, Nome, Classe, Genere, AnnoNascita FROM Studenti, Classi WHERE Studenti.IdClasse=Classi.Id";
            if (cmbClasse.SelectedIndex > 0)
            {
                sql += " AND Classi.Id=" + cmbClasse.SelectedValue;
            }
            gridStudenti.DataSource = db.GetDataTable(sql);
            gridStudenti.DataBind();
            rbAll.Checked = true;
        }

        protected void rbGender_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton rb = (RadioButton)sender;
            string sql = "SELECT Cognome, Nome, Classe, Genere, AnnoNascita FROM Studenti, Classi WHERE Studenti.IdClasse=Classi.Id";
            if (rb.Checked && rb.ID != "rbAll")
            {
                sql += " AND Genere = '" + rb.Text + "'";
            }
            gridStudenti.DataSource = db.GetDataTable(sql);
            gridStudenti.DataBind();
            cmbClasse.SelectedIndex = 0;
        }

        protected void btnCerca_Click(object sender, EventArgs e)
        {
            if (txtCognome.Text.Length > 0)
            {
                Response.Redirect("Dettagli.aspx?cognome=" + txtCognome.Text);
            }
        }
    }
}