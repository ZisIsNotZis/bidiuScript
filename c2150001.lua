require 'expansions.script.c2150000'
function c2150001.initial_effect(c)
	BiDiu(c)
	local e=Effect.CreateEffect(c)
	e:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e:SetCode(EVENT_ADJUST)
	e:SetRange(LOCATION_MZONE)
	e:SetOperation(c2150001.xyzo)
	c:RegisterEffect(e)
	e=Effect.CreateEffect(c)
	e:SetType(EFFECT_TYPE_FIELD)
	e:SetCode(EFFECT_DISABLE_FIELD)
	e:SetRange(LOCATION_MZONE)
	e:SetProperty(EFFECT_FLAG_REPEAT)
	e:SetOperation(c2150001.diso)
	c:RegisterEffect(e)
	e=Effect.CreateEffect(c)
	e:SetType(EFFECT_TYPE_FIELD)
	e:SetCode(EFFECT_DISABLE)
	e:SetRange(LOCATION_MZONE)
	e:SetTargetRange(LOCATION_MZONE,LOCATION_MZONE)
	e:SetOperation(c2150001.nego)
	c:RegisterEffect(e)
end
function c2150001.xyzo(e,tp)
	local g=Duel.GetOverlayGroup(0,LOCATION_MZONE,LOCATION_MZONE)
	Duel.SendtoGrave(g,REASON_EFFECT)
	Duel.Damage(1-tp,g:FilterCount(c2150000.xyzf,nil,1-tp)*800,REASON_EFFECT)
end
function c2150001.xyzf(c,tp)
	return c:IsControler(tp) and c:IsLocation(LOCATION_GRAVE)
end
function c2150001.diso(e,tp)
	local g=Duel.GetMatchingGroup(Card.IsType,0,LOCATION_MZONE,LOCATION_MZONE,nil,TYPE_LINK)
	local c=g:GetFirst()
	local z=0
	while c do
		z=bit.bor(z,c:GetLinkedZone())
		c=g:GetNext()
	end
	return z
end
function c2150001.nego(e,c):
	local g=Duel.GetMatchingGroup(Card.IsType,0,LOCATION_MZONE,LOCATION_MZONE,nil,TYPE_LINK)
	local i=g:Group.GetFirst()
	while i do
		if i:GetLinkedGroup():IsContains(c) then return true end
		i=g:GetNext()
	end
	return false
end
