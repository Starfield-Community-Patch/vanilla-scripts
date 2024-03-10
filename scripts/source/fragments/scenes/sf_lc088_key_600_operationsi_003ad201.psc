ScriptName Fragments:Scenes:SF_LC088_Key_600_OperationsI_003AD201 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
wwiseevent Property DRS_QST_CF08_GenIntRmSmWallMid_DoorD01_Open Auto Const mandatory
ReferenceAlias Property Alias_Ops_EntryDoor Auto Const

;-- Functions ---------------------------------------

Function Fragment_Phase_01_Begin()
  DRS_QST_CF08_GenIntRmSmWallMid_DoorD01_Open.Play(Alias_Ops_EntryDoor.GetRef(), None, None)
EndFunction
