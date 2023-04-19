# Build the SCM_Coach database on the local DB server using
# MS shell utiltiy sqlcmd. 


$SRCpath = $Env:HOMEDRIVE + $Env:HOMEPATH  + '\Documents\GitHub\SCM_Coach\SQL_BUILD\'

Set-Location $SRCpath

$server = 'localHost\SQLEXPRESS'
$rootdb = 'master'
$db = 'SCM_Coach'

$fn = $SRCPath + 'SCM_Coach_v0.0.0.11.sql'
Invoke-Sqlcmd -ServerInstance $server -E  -Database $rootdb -InputFile $fn

$fn = $SRCPath + 'CREATE_Function_SwimmerAge.sql'
Invoke-Sqlcmd -ServerInstance $server -E -Database $db -InputFile $fn

$fn = $SRCPath + 'INSERT_contactType.sql'
Invoke-Sqlcmd -ServerInstance $server -E -Database $db -InputFile $fn

$fn = $SRCPath + 'INSERT_course.sql'
Invoke-Sqlcmd -ServerInstance $server -E -Database $db -InputFile $fn

$fn = $SRCPath + 'INSERT_distance.sql'
Invoke-Sqlcmd -ServerInstance $server -E -Database $db -InputFile $fn

$fn = $SRCPath + 'INSERT_drill.sql'
Invoke-Sqlcmd -ServerInstance $server -E -Database $db -InputFile $fn

$fn = $SRCPath + 'INSERT_drillEx.sql'
Invoke-Sqlcmd -ServerInstance $server -E -Database $db -InputFile $fn

$fn = $SRCPath + 'INSERT_equipment.sql'
Invoke-Sqlcmd -ServerInstance $server -E -Database $db -InputFile $fn

$fn = $SRCPath + 'INSERT_gender.sql'
Invoke-Sqlcmd -ServerInstance $server -E -Database $db -InputFile $fn

$fn = $SRCPath + 'INSERT_grade.sql'
Invoke-Sqlcmd -ServerInstance $server -E -Database $db -InputFile $fn

$fn = $SRCPath + 'INSERT_HRType.sql'
Invoke-Sqlcmd -ServerInstance $server -E -Database $db -InputFile $fn

$fn = $SRCPath + 'INSERT_intensity.sql'
Invoke-Sqlcmd -ServerInstance $server -E -Database $db -InputFile $fn

$fn = $SRCPath + 'INSERT_miscTerm.sql'
Invoke-Sqlcmd -ServerInstance $server -E -Database $db -InputFile $fn

$fn = $SRCPath + 'INSERT_RaceHistoryType.sql'
Invoke-Sqlcmd -ServerInstance $server -E -Database $db -InputFile $fn

$fn = $SRCPath + 'INSERT_stroke.sql'
Invoke-Sqlcmd -ServerInstance $server -E -Database $db -InputFile $fn

$fn = $SRCPath + 'INSERT_swimmer.sql'
Invoke-Sqlcmd -ServerInstance $server -E -Database $db -InputFile $fn


<# 
# invoke sqlcmd
Invoke-sqlcmd -ServerInstance $server -Database $db -InputFile $filename

# direct
sqlcmd.exe -d TestDB -U $user -P $pw -I E:\SQLQuery.sql1

# via invoke expression
Invoke-Expression 'sqlcmd -d TestDB -U $user -P $pw -i "E:\SQLQuery1.sql"'

# the System.Data.SQLClient route:

$Conn=New-Object System.Data.SQLClient.SQLConnection "Server=YOURSERVER;Database=TestDB;User Id=$user;password=$pw";
$Conn.Open();
$DataCmd = New-Object System.Data.SqlClient.SqlCommand;
$MyQuery = get-content "e:\SQLQuery1.sql";
$DataCmd.CommandText = $MyQuery;
$DataCmd.Connection = $Conn;
$DAadapter = New-Object System.Data.SqlClient.SqlDataAdapter;
$DAadapter.SelectCommand = $DataCmd;
$DTable = New-Object System.Data.DataTable;
$DAadapter.Fill($DTable)|Out-Null;
$Conn.Close();
$Conn.Dispose();
$DTable; 

#>