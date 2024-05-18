ScriptName Fragments:Quests:QF_Patch_Update04_0020D381 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_SS_AkilaCity Auto Const mandatory
Int Property DistanceCheck Auto Const
ReferenceAlias Property Alias_SS_Cydonia Auto Const mandatory
ReferenceAlias Property Alias_SS_EleosRetreat Auto Const mandatory
ReferenceAlias Property Alias_SS_Gagarin Auto Const mandatory
ReferenceAlias Property Alias_SS_HopeTown Auto Const mandatory
ReferenceAlias Property Alias_SS_Neon Auto Const mandatory
ReferenceAlias Property Alias_SS_NewAtlantis Auto Const mandatory
ReferenceAlias Property Alias_SS_NewHomestead Auto Const mandatory
ReferenceAlias Property Alias_SS_Paradiso Auto Const mandatory
ReferenceAlias Property Alias_SS_RHQ Auto Const mandatory
ReferenceAlias Property Alias_SS_TheClinic Auto Const mandatory
ReferenceAlias Property Alias_SS_TheDen Auto Const mandatory
Quest Property City_NewAtlantis_Z_TheBoot Auto Const mandatory
ReferenceAlias Property Alias_Huong Auto Const mandatory
ReferenceAlias Property Alias_Hamza Auto Const mandatory
Quest Property FFNeonZ09 Auto Const mandatory
ReferenceAlias Property Alias_EarlFulton Auto Const mandatory
Quest Property City_NA_Botany02 Auto Const mandatory
Quest Property City_NA_Botany03 Auto Const mandatory
Quest Property CF05 Auto Const mandatory
ReferenceAlias Property Alias_CF05_Huan Auto Const mandatory
Quest Property CF04 Auto Const mandatory
ObjectReference Property CF04_AccessDoor01Ref Auto Const mandatory
ObjectReference Property CF04_AccessDoor02Ref Auto Const mandatory
ObjectReference Property CF04_AccessDoor03Ref Auto Const mandatory
ObjectReference Property CF04_SheilaDoorRef Auto Const mandatory
ObjectReference Property CF04_DumbroskyDoorRef Auto Const mandatory
ObjectReference Property CF04_SwistDoorRef Auto Const mandatory
ObjectReference Property CF04_VeraDoorRef Auto Const mandatory
ReferenceAlias Property Alias_VaruunBasementDoor Auto Const mandatory
sq_airlock_questscript Property PSQ_Airlock Auto Const mandatory
Quest Property MQ_TempleQuest_MQ104A Auto Const mandatory
Quest Property MQ104A Auto Const mandatory
ReferenceAlias Property Alias_Vasco Auto Const
Ammo Property Companion_AmmoLaser Auto Const
ReferenceAlias Property Alias_NadiaMuffaz Auto Const mandatory
ReferenceAlias Property Alias_SSNN_NadiaMuffaz_LocRef Auto Const mandatory
ReferenceAlias Property Alias_GeorgeSaintGeorge Auto Const mandatory
Key Property FCNeon_TradeTowerPlayerHomeKey Auto Const mandatory
sq_playerhousescript Property PlayerHouseSystem Auto Const mandatory
Quest Property MQ106 Auto Const mandatory
mq103script Property MQ103 Auto Const mandatory
mq204script Property MQ204 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_01()
  ObjectReference SS_AkilaRef = Alias_SS_AkilaCity.GetRef()
  ObjectReference FurnitureRef = SS_AkilaRef.GetLinkedRef(None)
  If SS_AkilaRef.GetDistance(FurnitureRef) > DistanceCheck as Float
    SS_AkilaRef.MoveTo(FurnitureRef, 0.0, 0.0, 0.0, True, False)
  EndIf
  ObjectReference SS_CydoniaRef = Alias_SS_Cydonia.GetRef()
  ObjectReference FurnitureRef_Cydonia = SS_CydoniaRef.GetLinkedRef(None)
  If SS_CydoniaRef.GetDistance(FurnitureRef_Cydonia) > DistanceCheck as Float
    SS_CydoniaRef.MoveTo(FurnitureRef_Cydonia, 0.0, 0.0, 0.0, True, False)
  EndIf
  ObjectReference SS_EleosRetreatRef = Alias_SS_EleosRetreat.GetRef()
  ObjectReference FurnitureRef_EleosRetreat = SS_EleosRetreatRef.GetLinkedRef(None)
  If SS_EleosRetreatRef.GetDistance(FurnitureRef_EleosRetreat) > DistanceCheck as Float
    SS_EleosRetreatRef.MoveTo(FurnitureRef_EleosRetreat, 0.0, 0.0, 0.0, True, False)
  EndIf
  ObjectReference SS_GagarinRef = Alias_SS_Gagarin.GetRef()
  ObjectReference FurnitureRef_Gagarin = SS_GagarinRef.GetLinkedRef(None)
  If SS_GagarinRef.GetDistance(FurnitureRef_Gagarin) > DistanceCheck as Float
    SS_GagarinRef.MoveTo(FurnitureRef_Gagarin, 0.0, 0.0, 0.0, True, False)
  EndIf
  ObjectReference SS_HopeTownRef = Alias_SS_HopeTown.GetRef()
  ObjectReference FurnitureRef_HopeTown = SS_HopeTownRef.GetLinkedRef(None)
  If SS_HopeTownRef.GetDistance(FurnitureRef_HopeTown) > DistanceCheck as Float
    SS_HopeTownRef.MoveTo(FurnitureRef_HopeTown, 0.0, 0.0, 0.0, True, False)
  EndIf
  ObjectReference SS_NeonRef = Alias_SS_Neon.GetRef()
  ObjectReference FurnitureRef_Neon = SS_NeonRef.GetLinkedRef(None)
  If SS_NeonRef.GetDistance(FurnitureRef_Neon) > DistanceCheck as Float
    SS_NeonRef.MoveTo(FurnitureRef_Neon, 0.0, 0.0, 0.0, True, False)
  EndIf
  ObjectReference SS_NewAtlantisRef = Alias_SS_NewAtlantis.GetRef()
  ObjectReference FurnitureRef_NewAtlantis = SS_NewAtlantisRef.GetLinkedRef(None)
  If SS_NewAtlantisRef.GetDistance(FurnitureRef_NewAtlantis) > DistanceCheck as Float
    SS_NewAtlantisRef.MoveTo(FurnitureRef_NewAtlantis, 0.0, 0.0, 0.0, True, False)
  EndIf
  ObjectReference SS_NewHomesteadRef = Alias_SS_NewHomestead.GetRef()
  ObjectReference FurnitureRef_NewHomestead = SS_NewHomesteadRef.GetLinkedRef(None)
  If SS_NewHomesteadRef.GetDistance(FurnitureRef_NewHomestead) > DistanceCheck as Float
    SS_NewHomesteadRef.MoveTo(FurnitureRef_NewHomestead, 0.0, 0.0, 0.0, True, False)
  EndIf
  ObjectReference SS_ParadisoRef = Alias_SS_Paradiso.GetRef()
  ObjectReference FurnitureRef_Paradiso = SS_ParadisoRef.GetLinkedRef(None)
  If SS_ParadisoRef.GetDistance(FurnitureRef_Paradiso) > DistanceCheck as Float
    SS_ParadisoRef.MoveTo(FurnitureRef_Paradiso, 0.0, 0.0, 0.0, True, False)
  EndIf
  ObjectReference SS_RHQRef = Alias_SS_RHQ.GetRef()
  ObjectReference FurnitureRef_RHQ = SS_RHQRef.GetLinkedRef(None)
  If SS_RHQRef.GetDistance(FurnitureRef_RHQ) > DistanceCheck as Float
    SS_RHQRef.MoveTo(FurnitureRef_RHQ, 0.0, 0.0, 0.0, True, False)
  EndIf
  ObjectReference SS_TheClinicRef = Alias_SS_TheClinic.GetRef()
  ObjectReference FurnitureRef_TheClinic = SS_TheClinicRef.GetLinkedRef(None)
  If SS_TheClinicRef.GetDistance(FurnitureRef_TheClinic) > DistanceCheck as Float
    SS_TheClinicRef.MoveTo(FurnitureRef_TheClinic, 0.0, 0.0, 0.0, True, False)
  EndIf
  ObjectReference SS_TheDenRef = Alias_SS_TheDen.GetRef()
  ObjectReference FurnitureRef_TheDen = SS_TheDenRef.GetLinkedRef(None)
  If SS_TheDenRef.GetDistance(FurnitureRef_TheDen) > DistanceCheck as Float
    SS_TheDenRef.MoveTo(FurnitureRef_TheDen, 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0000_Item_02()
  City_NewAtlantis_Z_TheBoot.SetObjectiveFailed(70, True)
EndFunction

Function Fragment_Stage_0000_Item_03()
  Actor HuongRef = Alias_Huong.GetActorRef()
  Actor HamzaRef = Alias_Hamza.GetActorRef()
  If HuongRef.IsDead()
    HuongRef.Resurrect()
  EndIf
  If HamzaRef.IsDead()
    HamzaRef.Resurrect()
  EndIf
EndFunction

Function Fragment_Stage_0000_Item_04()
  Alias_EarlFulton.GetActorRef().Resurrect()
  If City_NA_Botany02.IsCompleted() && !City_NA_Botany03.IsCompleted() && !City_NA_Botany03.IsRunning()
    City_NA_Botany03.Start()
  EndIf
EndFunction

Function Fragment_Stage_0000_Item_05()
  (CF05 as cf05_layerscript).CF05_Layer.EnableFastTravel(False)
  (CF05 as cf05_layerscript).CF05_Layer.EnableFarTravel(False)
  Game.GetPlayer().MoveTo(Alias_CF05_Huan.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0000_Item_06()
  CF04_AccessDoor01Ref.SetLockLevel(0)
  CF04_AccessDoor01Ref.Unlock(False)
  CF04_AccessDoor02Ref.SetLockLevel(0)
  CF04_AccessDoor02Ref.Unlock(False)
  CF04_AccessDoor03Ref.SetLockLevel(0)
  CF04_AccessDoor03Ref.Unlock(False)
  CF04_AccessDoor01Ref.SetOpen(True)
  CF04_AccessDoor02Ref.SetOpen(True)
EndFunction

Function Fragment_Stage_0000_Item_07()
  CF04_SheilaDoorRef.SetLockLevel(0)
  CF04_SheilaDoorRef.Unlock(False)
  CF04_DumbroskyDoorRef.SetLockLevel(0)
  CF04_DumbroskyDoorRef.Unlock(False)
  CF04_SwistDoorRef.SetLockLevel(0)
  CF04_SwistDoorRef.Unlock(False)
  CF04_VeraDoorRef.SetLockLevel(0)
  CF04_VeraDoorRef.Unlock(False)
EndFunction

Function Fragment_Stage_0000_Item_08()
  ObjectReference BaseDoorREF = Alias_VaruunBasementDoor.GetRef()
  BaseDoorREF.Unlock(False)
EndFunction

Function Fragment_Stage_0000_Item_09()
  PSQ_Airlock.RemoveActorFromInsideActorsAlias(Game.GetPlayer())
EndFunction

Function Fragment_Stage_0000_Item_10()
  MQ_TempleQuest_MQ104A.SetStageNoWait(10)
  If MQ104A.IsObjectiveDisplayed(70)
    MQ104A.SetObjectiveDisplayed(70, False, False)
    Utility.Wait(1.0)
    MQ104A.SetObjectiveDisplayed(70, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0000_Item_11()
  Alias_Vasco.GetRef().AddItem(Companion_AmmoLaser as Form, 1, False)
EndFunction

Function Fragment_Stage_0000_Item_12()
  Actor NadiaRef = Alias_NadiaMuffaz.GetActorRef()
  ObjectReference LocRef = Alias_SSNN_NadiaMuffaz_LocRef.GetRef()
  NadiaRef.MoveTo(LocRef, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0000_Item_13()
  Actor GeorgeRef = Alias_GeorgeSaintGeorge.GetActorRef()
  ObjectReference LocRef = Alias_SSNN_NadiaMuffaz_LocRef.GetRef()
  GeorgeRef.MoveTo(LocRef, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0000_Item_14()
  PlayerHouseSystem.PurchaseHouse(None, FCNeon_TradeTowerPlayerHomeKey)
EndFunction

Function Fragment_Stage_0000_Item_15()
  MQ106.Start()
EndFunction

Function Fragment_Stage_0000_Item_16()
  MQ103.MQ103EnableLayer.Delete()
EndFunction

Function Fragment_Stage_0000_Item_17()
  MQ204.MQ204EnableLayer.Delete()
EndFunction

Function Fragment_Stage_0000_Item_18()
  Self.Stop()
EndFunction
