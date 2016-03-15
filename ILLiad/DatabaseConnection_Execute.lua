--This returns the transaction numbers matching a specified transaction status. It has an example of supplying a parameterized value in the query

--These lines is usually in the beginning of the addon
luanet.load_assembly("System.Data");

--Set up a Types table to keep track of the imported .NET types so they can be used later
local Types = {};
Types['System.Data.SqlDbType'] = luanet.import_type('System.Data.SqlDbType');


function GetTransactionsTable(transactionStatus)
  local connection = CreateManagedDatabaseConnection();
  connection.QueryString = "SELECT TOP(500) [TransactionNumber], [Username] FROM Transactions WHERE [TransactionStatus] = @TransactionStatus";
	connection:AddParameter('@TransactionStatus', transactionStatus, Types['System.Data.SqlDbType'].NVarChar);

  connection:Connect();

  local results = connection:Execute();

  connection:Dispose();

  ProcessDataTable(results);
end

function ProcessDataTable(resultsTable)
  --This loops through every resulting transaction number in the result data table and adds it to a LUA table

  --Set up the lua table to store the TNs
  local tnArray = {};

  --Loop through all of the results in the data table and get the transaction number
  for i = 0, resultsTable.Rows.Count - 1 do
		local tn = resultsTable.Rows:get_Item(i):get_Item("TransactionNumber");
    local username = resultsTable.Rows:get_Item(i):get_Item("Username");
    LogDebug("Processing transaction " .. tn);
    tnArray[i] = tn;
	end

  return tnArray;
end
