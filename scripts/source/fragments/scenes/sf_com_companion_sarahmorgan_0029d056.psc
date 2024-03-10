ScriptName Fragments:Scenes:SF_COM_Companion_SarahMorgan_0029D056 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_08_End()
  com_convoquestscript kmyQuest = Self.GetOwningQuest() as com_convoquestscript
  kmyQuest.SceneCompleted()
EndFunction
