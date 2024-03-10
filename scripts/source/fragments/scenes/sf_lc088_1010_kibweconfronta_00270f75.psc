ScriptName Fragments:Scenes:SF_LC088_1010_KibweConfronta_00270F75 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
wwiseevent Property DRS_QST_CF08_ShipA_VerticalA_Open Auto Const mandatory
ReferenceAlias Property Alias_Ops_EntryDoor Auto Const

;-- Functions ---------------------------------------

Function Fragment_Phase_01_Begin()
  DRS_QST_CF08_ShipA_VerticalA_Open.Play(Alias_Ops_EntryDoor.GetRef(), None, None)
EndFunction
