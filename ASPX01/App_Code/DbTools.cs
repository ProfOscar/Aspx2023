using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ASPX01.App_Code
{
    public class DbTools
    {
        private string connStr;

        public DbTools(string connStr)
        {
            this.connStr = connStr;
        }

        public DataTable GetDataTable(string sql)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
                    {
                        using (DataTable table = new DataTable())
                        {
                            adp.Fill(table);
                            return table;
                        }
                    }
                }
            }
        }
    }
}