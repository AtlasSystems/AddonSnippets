--First get the transaction number that is currently being processed and save to the tn variable
local tn = GetFieldValue("Transaction", "TransactionNumber");

--Execute the AddNote command.
ExecuteCommand("AddNote", {tn, "Sample Note"});
