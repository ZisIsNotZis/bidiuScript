function c2150025.initial_effect(c)
	local e=Effect.CreateEffect(c)
	e:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_O)
	e:SetCode(EVENT_CHAIN_SOLVED)
	e:SetRange(LOCATION_HAND+LOCATION_GRAVE)
	e:SetTarget(c2150025.t)
	e:SetOperation(c2150025.o)
	e:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e:SetValue(0)
	c:RegisterEffect(e)
end
function c2150025.f(c)
	return c:IsLevelBelow(3) or c:IsRankBelow(3) or c:IsLinkBelow(3)
end
function c2150025.t(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return re:GetHandler():IsSetCard(0x220) and re:GetLabel()&2>0 and e:GetHandler():IsCanBeSpecialSummoned(e,0,tp,false,false) and Duel.GetLocationCount(tp,LOCATION_MZONE)>0 and (e:GetHandler():IsLocation(LOCATION_HAND) or e:GetHandler():GetTurnID()<Duel.GetTurnCount()) end
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,e:GetHandler(),1,tp,e:GetLocation())
	e:SetValue(2)
end
function c2150025.o(e,tp)
	Duel.ConfirmCards(tp,Duel.GetFieldGroup(tp,0,LOCATION_HAND))
	Duel.SendtoHand(Duel.SelectMatchingCard(tp,nil,tp,0,LOCATION_HAND,1,2,nil),tp,REASON_EFFECT)
	if e:GetHandler():IsRelateToEffect(e) then Duel.SpecialSummon(e:GetHandler(),0,tp,tp,false,false,POS_FACEUP) end
end