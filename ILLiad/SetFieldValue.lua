--Note: It is only possible to use SetFieldValue & save values based on the type of addon (and form the addon is visible on)
--Client Addon / Form Request: Only the Transaction Data Source
--Client Addon / Form User: Only the User Data Source
--Client Addon / Form Main: SetFieldValue is not available
--Server Addon : Only the Transaction Data Source (when using ProcessDataContext)

--Sets the ReasonForCancellation field on the current transaction
SetFieldValue("Transaction", "ReasonForCancellation", "Checked Out");

--Make sure that the data source is saved after using SetFieldValue
SaveDataSource("Transaction");
