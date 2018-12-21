require 'expansions.script.c2150000'
function c2150009.initial_effect(c)
	BiDiu.e(c)
	local e=Effect.CreateEffect(c)
	e:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_O)
	e:SetCode(EVENT_SUMMON_SUCCESS)
	e:SetRange(LOCATION_HAND)
	e:SetProperty(EFFECT_FLAG_DELAY)
	e:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e:SetTarget(c2150009.t)
	e:SetOperation(c2150009.o)
	c:RegisterEffect(e)
	e=e:Clone()
	e:SetCode(EVENT_SPSUMMON_SUCCESS)
	c:RegisterEffect(e)
	e=e:Clone()
	e:SetCode(EVENT_MSET)
	c:RegisterEffect(e)
end
function c2150009.t(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return eg:IsExists(Card.IsControler,1,nil,1-tp) and Duel.GetLocationCount(tp,LOCATION_MZONE)>0 and e:GetHandler():IsCanBeSpecialSummoned(e,0,tp,false,false) end
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,e:GetHandler(),1,tp,0)
end
function c2150009.o(e,tp)
	if e:GetHandler():IsRelateToEffect(e) then
		Duel.SpecialSummon(e:GetHandler(),0,tp,tp,false,false,POS_FACEUP)
	end
end
