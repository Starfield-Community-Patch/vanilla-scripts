ScriptName MQ201BScript Extends Quest

;-- Variables ---------------------------------------
ObjectReference AndrejaHomeMarker
ObjectReference BarrettHomeMarker
ObjectReference CoraHomeMarker
ObjectReference SamHomeMarker
ObjectReference SarahHomeMarker

;-- Properties --------------------------------------
Faction Property AvailableCompanionFaction Auto Const mandatory
Keyword Property LinkHome Auto Const mandatory
ObjectReference Property EyeHomeMarker Auto Const mandatory
ReferenceAlias Property Andreja Auto Const mandatory
ReferenceAlias Property Barrett Auto Const mandatory
ReferenceAlias Property SamCoe Auto Const mandatory
ReferenceAlias Property CoraCoe Auto Const mandatory
ReferenceAlias Property SarahMorgan Auto Const mandatory
GlobalVariable Property COM_CompanionID_Andreja Auto Const mandatory
GlobalVariable Property COM_CompanionID_Barrett Auto Const mandatory
GlobalVariable Property COM_CompanionID_SamCoe Auto Const mandatory
GlobalVariable Property COM_CompanionID_SarahMorgan Auto Const mandatory
GlobalVariable Property MQ_CompanionAtEye Auto Const mandatory
GlobalVariable Property MQ_CompanionAtLodge Auto Const mandatory
ReferenceAlias Property MQ00_CompanionAtEye Auto Const mandatory
ReferenceAlias Property MQ00_CompanionAtLodge Auto Const mandatory
Quest Property SQ_Companions Auto Const mandatory
ActorValue Property COM_AffinityLevel Auto Const mandatory
ActorValue Property COM_Affinity Auto Const mandatory

;-- Functions ---------------------------------------

Function SetCompanionsAtRisk()
  companionactorscript[] CompanionActorArray = new companionactorscript[4]
  CompanionActorArray[0] = SarahMorgan.GetActorRef() as companionactorscript
  CompanionActorArray[1] = SamCoe.GetActorRef() as companionactorscript
  CompanionActorArray[2] = Barrett.GetActorRef() as companionactorscript
  CompanionActorArray[3] = Andreja.GetActorRef() as companionactorscript
  (SQ_Companions as sq_companionsscript).SortCompanionArrayByAffinity(CompanionActorArray, True)
  Self.SetCompanionAtEye(CompanionActorArray[0])
  Self.SetCompanionAtLodge(CompanionActorArray[1])
EndFunction

Function SetCompanionAtEye(companionactorscript Companion)
  MQ00_CompanionAtEye.ForceRefTo(Companion as ObjectReference)
  Companion.SetGlobalToCompanionID(MQ_CompanionAtEye)
EndFunction

Function SetCompanionAtLodge(companionactorscript Companion)
  MQ00_CompanionAtLodge.ForceRefTo(Companion as ObjectReference)
  Companion.SetGlobalToCompanionID(MQ_CompanionAtLodge)
EndFunction

Function SetCompanionsHomeLink()
  Actor AndrejaREF = Andreja.GetActorRef()
  Actor BarrettREF = Barrett.GetActorRef()
  Actor SamCoeREF = SamCoe.GetActorRef()
  Actor SarahMorganREF = SarahMorgan.GetActorRef()
  Actor CoraCoeREF = CoraCoe.GetActorRef()
  AndrejaHomeMarker = AndrejaREF.GetLinkedRef(LinkHome)
  BarrettHomeMarker = BarrettREF.GetLinkedRef(LinkHome)
  SamHomeMarker = SamCoeREF.GetLinkedRef(LinkHome)
  CoraHomeMarker = CoraCoeREF.GetLinkedRef(LinkHome)
  SarahHomeMarker = SarahMorganREF.GetLinkedRef(LinkHome)
  AndrejaREF.SetLinkedRef(EyeHomeMarker, LinkHome, True)
  BarrettREF.SetLinkedRef(EyeHomeMarker, LinkHome, True)
  SamCoeREF.SetLinkedRef(EyeHomeMarker, LinkHome, True)
  SarahMorganREF.SetLinkedRef(EyeHomeMarker, LinkHome, True)
  CoraCoeREF.SetLinkedRef(EyeHomeMarker, LinkHome, True)
EndFunction

Function ResetCompanionsHomeLink()
  Actor AndrejaREF = Andreja.GetActorRef()
  Actor BarrettREF = Barrett.GetActorRef()
  Actor SamCoeREF = SamCoe.GetActorRef()
  Actor SarahMorganREF = SarahMorgan.GetActorRef()
  Actor CoraCoeREF = CoraCoe.GetActorRef()
  AndrejaREF.SetLinkedRef(AndrejaHomeMarker, LinkHome, True)
  BarrettREF.SetLinkedRef(BarrettHomeMarker, LinkHome, True)
  SamCoeREF.SetLinkedRef(SamHomeMarker, LinkHome, True)
  SarahMorganREF.SetLinkedRef(SarahHomeMarker, LinkHome, True)
  CoraCoeREF.SetLinkedRef(CoraHomeMarker, LinkHome, True)
EndFunction
