ScriptName Fragments:Scenes:SF_Cam_HLoopStart_0005512D Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property NA_TransitTrack Auto Const
ReferenceAlias Property NA_TransitTrack02 Auto Const
wwiseevent Property SoundTramDepartEvent Auto Const
wwiseevent Property SoundTramArriveEvent Auto Const
MusicType Property MUSGenesisStingerCutsceneTransitionTEST Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
ReferenceAlias Property Vasco Auto Const
ObjectReference Property UC_NAT_EmbassyFollowerMarker Auto Const mandatory
ObjectReference Property NA_NAT_SpaceportMarkerRef Auto Const mandatory
ObjectReference Property NA_NAT_MASTMarkerRef Auto Const mandatory
ObjectReference Property NA_NAT_ResidentialMarkerREF Auto Const mandatory
ObjectReference Property NA_NAT_CommercialMarkerREF Auto Const mandatory
ObjectReference Property UC04_Player_NATTeleportMarker_Stage610 Auto Const mandatory
ReferenceAlias Property NA_TransitMASTHelper Auto Const
ReferenceAlias Property NA_TransitCommercialHelper Auto Const
ReferenceAlias Property NA_TransitResidentialHelper Auto Const

;-- Functions ---------------------------------------

Function Fragment_Phase_01_End()
  citynewatlantistransitcontrolscript kmyQuest = Self.GetOwningQuest() as citynewatlantistransitcontrolscript
  kmyQuest.Travel(UC04_Player_NATTeleportMarker_Stage610)
EndFunction

Function Fragment_Phase_02_End()
  citynewatlantistransitcontrolscript kmyQuest = Self.GetOwningQuest() as citynewatlantistransitcontrolscript
  kmyQuest.Travel(NA_NAT_MASTMarkerRef)
EndFunction

Function Fragment_Phase_03_Begin()
  NA_TransitTrack.getref().PlayAnimation("Depart")
  NA_TransitTrack.getref().PlayAnimation("Stage2")
EndFunction

Function Fragment_Phase_04_Begin()
  NA_TransitMASTHelper.getref().PlayAnimation("Depart")
EndFunction

Function Fragment_Phase_05_Begin()
  NA_TransitResidentialHelper.getref().PlayAnimation("Depart")
EndFunction

Function Fragment_Phase_06_Begin()
  NA_TransitCommercialHelper.getref().PlayAnimation("Depart")
EndFunction

Function Fragment_Phase_07_Begin()
  NA_TransitTrack.getref().PlayAnimation("Arrive")
EndFunction

Function Fragment_Phase_07_End()
  citynewatlantistransitcontrolscript kmyQuest = Self.GetOwningQuest() as citynewatlantistransitcontrolscript
  kmyQuest.Travel(NA_NAT_SpaceportMarkerRef)
EndFunction

Function Fragment_Phase_08_Begin()
  NA_TransitMASTHelper.getref().PlayAnimation("Arrive")
EndFunction

Function Fragment_Phase_08_End()
  citynewatlantistransitcontrolscript kmyQuest = Self.GetOwningQuest() as citynewatlantistransitcontrolscript
  kmyQuest.Travel(NA_NAT_MASTMarkerRef)
EndFunction

Function Fragment_Phase_09_Begin()
  NA_TransitResidentialHelper.getref().PlayAnimation("Arrive")
EndFunction

Function Fragment_Phase_09_End()
  citynewatlantistransitcontrolscript kmyQuest = Self.GetOwningQuest() as citynewatlantistransitcontrolscript
  kmyQuest.Travel(NA_NAT_ResidentialMarkerREF)
EndFunction

Function Fragment_Phase_10_Begin()
  NA_TransitCommercialHelper.getref().PlayAnimation("Arrive")
EndFunction

Function Fragment_Phase_10_End()
  citynewatlantistransitcontrolscript kmyQuest = Self.GetOwningQuest() as citynewatlantistransitcontrolscript
  kmyQuest.Travel(NA_NAT_CommercialMarkerREF)
EndFunction
