local isCurrentlyProcessing = false;

function Init()
	RegisterSystemEventHandler("SystemTimerElapsed", "TimerElapsed");
end

function TimerElapsed(eventArgs)
  --Check to make sure we are not already processing
  if (not isCurrentlyProcessing) then
		isCurrentlyProcessing = true;

    DoSomething();

    isCurrentlyProcessing = true;
  else
    LogDebug("Skipping processing.");
  end
end

function DoSomething()
  --Process requests here
end
