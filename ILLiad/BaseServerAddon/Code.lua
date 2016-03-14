function Init()
	RegisterSystemEventHandler("SystemTimerElapsed", "TimerElapsed");
end

function TimerElapsed(eventArgs)

end

function OnError(exception)
	LogDebug("Error in " .. exception.ScriptName .. " when calling " .. exception.ScriptMethod .. ": " .. exception.Message);
end
