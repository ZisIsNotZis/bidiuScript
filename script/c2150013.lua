require 'expansions.script.c2150000'
function c2150013.initial_effect(c)
	BiDiu.e(c)
	local e=Effect.CreateEffect(c)
	e:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e:SetCode(EVENT_ADJUST)
	e:SetRange(LOCATION_MZONE)
	e:SetOperation(c2150013.o)
	c:RegisterEffect(e)
end
function c2150013.o(e,tp)
	if Duel.GetLocationCount(tp,LOCATION_HAND)<1 then
		Duel.Draw(tp,1,REASON_EFFECT)
	end
end