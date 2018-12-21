require 'expansions.script.c2150000'
function c2150007.initial_effect(c)
	BiDiu.e(c)
	local e=Effect.CreateEffect(c)
	e:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e:SetCode(EVENT_PHASE+PHASE_END)
	e:SetRange(LOCATION_MZONE)
	e:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e:SetCategory(CATEGORY_DESTROY)
	e:SetCountLimit(1)
	e:SetTarget(c2150007.t)
	e:SetOperation(c2150007.o)
	c:RegisterEffect(e)
	c2150007[0]=0
	c2150007[1]=0
end
function c2150007.t(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return chkc:IsLocation(LOCATION_ONFIELD) end
	if chk==0 then return Duel.IsExistingTarget(nil,0,LOCATION_ONFIELD,LOCATION_ONFIELD,1,nil) end
	local t=Duel.SelectTarget(tp,nil,0,LOCATION_ONFIELD,LOCATION_ONFIELD,1,1,nil)
	Duel.SetOperationInfo(0,CATEGORY_DESTROY,t,1,0,0)
end
function c2150007.o(e,tp)
	local t=Duel.GetFirstTarget()
	if not t:IsRelateToEffect(e)then return end
	Duel.Destroy(t,REASON_EFFECT)
	if c2150007[tp]==0 then c2150007[tp]=1 else c2150007[tp]=0 Duel.Draw(tp,1,REASON_EFFECT)end
end
