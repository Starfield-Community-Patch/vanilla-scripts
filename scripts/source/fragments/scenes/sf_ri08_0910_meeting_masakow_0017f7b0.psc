ScriptName Fragments:Scenes:SF_RI08_0910_Meeting_MasakoW_0017F7B0 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_End()
  ri08_questscript kmyQuest = Self.GetOwningQuest() as ri08_questscript
  kmyQuest.UnfreezeControlsMeeting()
EndFunction
