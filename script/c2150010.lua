require 'expansions.script.c2150000'
function c2150010.initial_effect(c)
	local e=BiDiu.e(c)
	e:SetRange(LOCATION_SZONE)
	e:SetCountLimit(1)
	e:SetCost(aux.TRUE)
end