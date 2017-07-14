<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>View of Users</title>
  
    <script runat="server">
        void Page_Load(object sender, EventArgs e)
        {

           /* System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection();
            conn.ConnectionString =
            "Data Source=melcsa.dynalias.net;" +
            "Initial Catalog=ITInventory;" +
            "User id=MelcsaDBUser;" +
            "Password=Melcsa-1234;";
            conn.Open();*/

            if (!IsPostBack)
            {
                List<ReportingComponent.Users> users = null;
                List<ReportingComponent.Computer> computer = null;

               

                using (ReportingComponent.Database1Entities dc = new ReportingComponent.Database1Entities())
                {
                    ReportingComponent.ITInventoryEntities itI = new ReportingComponent.ITInventoryEntities();
                    
                    users = dc.Users.OrderBy(a => a.UserId).ToList();
                    computer = itI.Computer.OrderBy(x => x.userId).ToList();                   
                   
                    ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/RPTReport/Report1.rdlc");
                    ReportViewer1.LocalReport.DataSources.Clear();
                    ReportDataSource rdc = new ReportDataSource("DataSet1", users);
                    ReportDataSource rds = new ReportDataSource("DataSet2", computer);
                    ReportViewer1.LocalReport.DataSources.Add(rdc);
                    ReportViewer1.LocalReport.DataSources.Add(rds);
                    ReportViewer1.LocalReport.Refresh();
                }
            }
        }
    </script>

</head>
<body>
    <h1>Hola!</h1>

    <form id="form1" runat="server">
    <div>
        
    </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" AsyncRendering="false" SizeToReportContent="true">
        </rsweb:ReportViewer>
    </form>
</body>
</html>
