--ProcessDataContext can loop through each request so that individual actions can be performed. There are two ways to do this currently: provide the transaction status that should be processed or individual transaction numbers to be processed.

--ProcessDataContext by status
function ProcessStatusRequests()
    --This fetches all transactions at "Awaiting Special Processing" and triggers the HandleStatusContextProcessing function for each
		ProcessDataContexts("TransactionStatus", "Awaiting Special Processing", "HandleStatusContextProcessing");
end

function HandleStatusContextProcessing()
  --This function is called by the ProcessDataContext within ProcessStatusRequests for each transaction
  local tn = GetFieldValue("Transaction", "TransactionNumber");
  SetFieldValue("Transaction", "ItemInfo1", "Processed by the TransactionStatus Data Context");
  SaveDataSource("Transaction");
end

--ProcessDataContext by TransactioNumber
function ProcessTNRequests()
    --This fetches all transaction number 10, 15, and 20 and triggers the HandleTransactionNumberContextProcessing function for each
    --It would be typical to use this after doing a separate query to retrieve transaction numbers
		ProcessDataContexts("TransactionNumber", { 10, 15, 20 }, "HandleTransactionNumberContextProcessing");
end

function HandleTransactionNumberContextProcessing()
  --This function is called by the ProcessDataContext within ProcessTNRequests for each transaction
  local tn = GetFieldValue("Transaction", "TransactionNumber");
  SetFieldValue("Transaction", "ItemInfo2", "Processed by the TransactionNumber Data Context");
  SaveDataSource("Transaction");
end
