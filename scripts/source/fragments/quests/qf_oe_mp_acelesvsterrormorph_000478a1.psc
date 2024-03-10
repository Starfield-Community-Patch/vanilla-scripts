ScriptName Fragments:Quests:QF_OE_MP_AcelesVsTerrormorph_000478A1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Terrormorph_Main Auto Const mandatory
ReferenceAlias Property Alias_Terrormorph_Alt Auto Const mandatory
ReferenceAlias Property Alias_Terrormorph_Add Auto Const mandatory
GlobalVariable Property OEDebug Auto Const mandatory
ReferenceAlias Property Alias_Furniture_Ambush_Terrormorph Auto Const mandatory
ReferenceAlias Property Alias_Furniture_Ambush_Terrormorph_Add Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  If OEDebug.GetValue() == 0.0
    Self.SetStage(5)
  Else
    Self.SetStage(1)
  EndIf
EndFunction

Function Fragment_Stage_0005_Item_00()
  If Utility.RandomInt(1, 3) == 1
    Self.SetStage(10)
  Else
    Self.SetStage(20)
  EndIf
  If Utility.RandomInt(1, 4) == 1
    Self.SetStage(30)
  EndIf
EndFunction

Function Fragment_Stage_0010_Item_00()
  ObjectReference AmbushFurniture = Alias_Furniture_Ambush_Terrormorph.GetRef()
  ObjectReference Terrormorph = Alias_Terrormorph_Main.GetRef()
  If Terrormorph as Bool && AmbushFurniture as Bool
    Terrormorph.Enable(False)
    Terrormorph.MoveTo(AmbushFurniture, 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0020_Item_00()
  ObjectReference AmbushFurniture = Alias_Furniture_Ambush_Terrormorph.GetRef()
  ObjectReference Terrormorph = Alias_Terrormorph_Alt.GetRef()
  If Terrormorph as Bool && AmbushFurniture as Bool
    Terrormorph.Enable(False)
    Terrormorph.MoveTo(AmbushFurniture, 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0200_Item_00()
  If Self.GetStageDone(30)
    Self.SetStage(210)
  EndIf
EndFunction

Function Fragment_Stage_0210_Item_00()
  ObjectReference AmbushFurniture = Alias_Furniture_Ambush_Terrormorph_Add.GetRef()
  ObjectReference Terrormorph = Alias_Terrormorph_Add.GetRef()
  If Terrormorph as Bool && AmbushFurniture as Bool
    Terrormorph.Enable(False)
    Terrormorph.MoveTo(AmbushFurniture, 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction
