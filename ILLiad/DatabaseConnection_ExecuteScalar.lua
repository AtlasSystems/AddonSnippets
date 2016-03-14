--This is a simple function that returns the number of transactions in the ILLiad database
--See DatabaseConnection_With_ErrorHandling for a safer version of this method
function GetTransactionCount()
  local connection = CreateManagedDatabaseConnection();
  connection.Querystring = "SELECT Count(*) FROM Transactions;";
  connection:Connect();
  local count = connection:ExecuteScalar();
  connection:Dispose();

  return count;
end
