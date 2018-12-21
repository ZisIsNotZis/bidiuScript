require 'expansions.script.c2150000'
function c2150012.initial_effect(c)
	BiDiu.e(c)
	local e=Effect.CreateEffect(c)
	e:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_O)
	e:SetCode(EVENT_SPSUMMON_SUCCESS)
	e:SetRange(LOCATION_MZONE)
	e:SetProperty(EFFECT_FLAG_DELAY+EFFECT_FLAG_CARD_TARGET+EFFECT_FLAG_DAMAGE_STEP)
	e:SetCountLimit(1)
	e:SetTarget(c2150012.t)
	e:SetOperation(c2150012.o)
	c:RegisterEffect(e)
end	
function c2150012.f(c,seq,eg)
	local t=c:GetSequence()
	return ((t<5 and 2<t+seq and t+seq<6) or (t==5 and 1<seq) or (t==6 and seq<3)) and (eg==nil or eg:IsContains(c))
end
function c2150012.t(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return chkc:IsControler(1-tp) and c2150012.f(chkc,e:GetHandler():GetSequence(),nil) end
	if chk==0 then return Duel.IsExistingTarget(c2150012.f,tp,0,LOCATION_MZONE,1,nil,e:GetHandler():GetSequence(),eg) and Duel.GetLocationCount(tp,LOCATION_SZONE)>0 end
	Duel.SelectTarget(tp,c2150012.f,tp,0,LOCATION_MZONE,1,1,nil,e:GetHandler():GetSequence(),eg)
end
function c2150012.o(e,tp)
	local c=Duel.GetFirstTarget()
	local h=e:GetHandler()
	if c:IsRelateToEffect(e) and h:IsRelateToEffect(e) then
		Duel.Equip(tp,c,h,true)
		local e1=Effect.CreateEffect(c)
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_EQUIP_LIMIT)
		e1:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
		e1:SetReset(RESET_EVENT+RESETS_STANDARD)
		e1:SetValue(c2150012.eqlimit)
		h:RegisterEffect(e1)
	end
end
function c2150012.eqlimit(e,c)
	return e:GetOwner()==c
end