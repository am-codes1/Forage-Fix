local function clamp(_value, _min, _max)
	if _min > _max then _min, _max = _max, _min; end;
	return math.min(math.max(_value, _min), _max);
end

function forageSystem.getExhaustionPenalty(_character)
	local enduranceLevel = 1 - _character:getStats():getEndurance();
	local fatigueLevel = _character:getStats():getFatigue();
	--
	local exhaustionPenalty = math.max(enduranceLevel, fatigueLevel);
	return clamp(1 - exhaustionPenalty, 1 - (forageSystem.exhaustionPenaltyMax / 100), 1);
end