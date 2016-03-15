function Main
  local variable = "";
  local success, result = pcall(ValidatePositiveNumber, variable);

  if (not success)
    --variable is nil or blank so success is false.
    --result is the value passed in error
    LogDebug(result.Message); --result.Message is the same as result["Message"]
  end

  --Do something with the variable
end

function ValidatePositiveNumber(value)

  --Throw exception if number is not provided
  if (value == nil) then
    --Use the lua error function to break out of the function and pass back a LUA table field named Message
    error({ Message = "Value is empty" });
  end

  --Try to convert the value to a number
  local n = tonumber(value);

  --The 'n' result is the number when converted or set to nil if the value could not be converted
  return (n ~= nil);
end
