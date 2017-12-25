#Create SQL Connection
#$con = new-object "System.data.sqlclient.SQLconnection"

#Set Connection String
#$con.ConnectionString =(“Data Source=DESKTOP\PRIORITY_INST;Initial Catalog=demo;Integrated Security=SSPI”)
#$con.open()

#$sqlcmd = new-object "System.data.sqlclient.sqlcommand"
#$sqlcmd.connection = $con
#$sqlcmd.CommandTimeout = 600000
#$sqlcmd.CommandText = “SELECT * FROM PART”
#$sqlcmd.ExecuteReader()
#$rowsAffected = $sqlcmd.ExecuteNonQuery()


[string] $Server= "DESKTOP\PRIORITY_INST"
[string] $Database = "demo"
[string] $UserSqlQuery= $("SELECT * FROM PART")



# executes a query and populates the $datatable with the data
function ExecuteSqlQuery ($Server, $Database, $SQLQuery) {
    $Datatable = New-Object System.Data.DataTable
    
    $Connection = New-Object System.Data.SQLClient.SQLConnection
    $Connection.ConnectionString = "server='$Server';database='$Database';trusted_connection=true;"
    $Connection.Open()
    $Command = New-Object System.Data.SQLClient.SQLCommand
    $Command.Connection = $Connection
    $Command.CommandText = $SQLQuery
    $Reader = $Command.ExecuteReader()
    $Datatable.Load($Reader)
    $Connection.Close()
    
    return $Datatable
}
# declaration not necessary, but good practice
$resultsDataTable = New-Object System.Data.DataTable
$resultsDataTable = ExecuteSqlQuery $Server $Database $UserSqlQuery 
#validate we got data
Write-Host ("The table contains: " + $resultsDataTable.Rows.Count + " rows")