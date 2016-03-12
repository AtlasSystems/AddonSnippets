--First get the transaction number that is currently being processed and save to the tn variable
local transactionNumber = GetFieldValue("Transaction", "TransactionNumber");

--Execute the Route command
ExecuteCommand("Route", {transactionNumber, "Cancelled by ILL Staff" });
