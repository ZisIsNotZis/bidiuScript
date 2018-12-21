require 'expansions.script.c2150000'
function c2150001.initial_effect(c)
	BiDiu.e(c)
	local e=Effect.CreateEffect(c)
	e:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e:SetCode(EVENT_ADJUST)
	e:SetRange(LOCATION_MZONE)
	e:SetOperation(c2150001.oXyz)
	c:RegisterEffect(e)
	e=Effect.CreateEffect(c)
	e:SetType(EFFECT_TYPE_FIELD)
	e:SetCode(EFFECT_DISABLE_FIELD)
	e:SetRange(LOCATION_MZONE)
	e:SetProperty(EFFECT_FLAG_REPEAT)
	e:SetOperation(c2150001.oDs)
	c:RegisterEffect(e)
	e=Effect.CreateEffect(c)
	e:SetType(EFFECT_TYPE_FIELD)
	e:SetCode(EFFECT_DISABLE)
	e:SetRange(LOCATION_MZONE)
	e:SetTargetRange(LOCATION_MZONE,LOCATION_MZONE)
	e:SetTarget(c2150001.oNg)
	e:SetValue(1)
	c:RegisterEffect(e)
	e=e:Clone()
	e:SetCode(EFFECT_CANNOT_ATTACK_ANNOUNCE)
	c:RegisterEffect(e)
	e=Effect.CreateEffect(c)
	e:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
	e:SetCode(EVENT_LEAVE_FIELD)
	e:SetRange(255)
	e:SetOperation(c2150001.oLeave)
	c:RegisterEffect(e)
end
function c2150001.oXyz(e,tp)
	Duel.SendtoGrave(Duel.GetOverlayGroup(0,LOCATION_MZONE,LOCATION_MZONE),REASON_EFFECT)
end
function c2150001.oDs(e,tp)
	local g=Duel.GetMatchingGroup(Card.IsType,0,LOCATION_MZONE,LOCATION_MZONE,nil,TYPE_LINK)
	local c=g:GetFirst()
	local z=0
	while c do
		z=bit.bor(z,c:GetLinkedZone(tp))
		z=bit.bor(z,c:GetLinkedZone(1-tp)*65536)
		c=g:GetNext()
	end
	return z
end
function c2150001.oNg(e,t)
	local g=Duel.GetMatchingGroup(Card.IsType,0,LOCATION_MZONE,LOCATION_MZONE,nil,TYPE_LINK)
	local c=g:GetFirst()
	while c do
		if c:GetLinkedGroup():IsContains(t) then return true end
		c=g:GetNext()
	end
	return false
end
function c2150001.oLeave(e)
	local g=Duel.GetMatchingGroup(Card.IsType,0,LOCATION_MZONE,LOCATION_MZONE,nil,TYPE_LINK)
	local c=g:GetFirst()
	if not c then return end
	local h=c:GetLinkedGroup()
	c=g:GetNext()
	while c do
		h:Merge(c:GetLinkedGroup())
		c=g:GetNext()
	end
	g=h
	if g:GetCount()>0 then
		c=g:GetFirst()
		e=Effect.CreateEffect(e:GetHandler())
		e:SetType(EFFECT_TYPE_SINGLE)
		e:SetCode(EFFECT_DISABLE)
		e:SetRange(LOCATION_MZONE)
		e:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_END, 2)
		e:SetValue(1)
		c:RegisterEffect(e)
		local f=e:Clone()
		f:SetCode(EFFECT_CANNOT_ATTACK_ANNOUNCE)
		c:RegisterEffect(f)
		c=g:GetNext()
		while c do
			c:RegisterEffect(e)
			c:RegisterEffect(f)
			c=g:GetNext()
		end
	end
end