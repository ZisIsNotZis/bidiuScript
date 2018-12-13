require 'expansions.script.c2150000'
function c2150010.initial_effect(c)
	local e=Effect.CreateEffect(c)
	e:SetType(EFFECT_TYPE_ACTIVATE)
	e:SetCode(EVENT_FREE_CHAIN)
	c:RegisterEffect(e)
	e=Effect.CreateEffect(c)
	e:SetType(EFFECT_TYPE_FIELD)
	e:SetCode(EFFECT_UPDATE_ATTACK)
	e:SetRange(LOCATION_SZONE)
	e:SetTargetRange(LOCATION_MZONE,0)
	e:SetValue(c2150010.v)
	c:RegisterEffect(e)
end
function c2150010.v(e,c)
	if not c:IsSetCard(0x215) then return 0 end
	return (3-c:GetColumnGroup():Filter(Card.IsControler,nil,1-e:GetHandlerPlayer()):GetCount())*700
end