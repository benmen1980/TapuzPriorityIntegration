#Create SQL Connection
$con = new-object "System.data.sqlclient.SQLconnection"

#Set Connection String
$con.ConnectionString =(“Data Source=DESKTOP\PRIORITY_INST;Initial Catalog=demo;Integrated Security=SSPI”)
$con.open()

$sqlcmd = new-object "System.data.sqlclient.sqlcommand"
$sqlcmd.connection = $con
$sqlcmd.CommandTimeout = 600000
$sqlcmd.CommandText = “SELECT * FROM PART”
$sqlcmd.ExecuteReader()
#$rowsAffected = $sqlcmd.ExecuteNonQuery()