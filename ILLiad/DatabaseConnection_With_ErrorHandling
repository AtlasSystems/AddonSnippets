--This example is a safer method of the function found in DatabaseConnection_ExecuteScalar
--This handles issues if  connection could not be opened or there is an error executing the SQL Querystring
--to ensure the database connection is cleaned up properly
function GetTransactionCount()
  local connection = CreateManagedDatabaseConnection();

  local success, result = pcall(function ()
    connection.Querystring = "SELECT Count(*) FROM Transactions;";
    connection:Connect();
    return connection:ExecuteScalar();
  end);

  --always disconnect & dispose the connection
  connection:Dispose();

  if (success) then
    return result;
  else
    --Figure out what should happen since there was an error
  end
end
