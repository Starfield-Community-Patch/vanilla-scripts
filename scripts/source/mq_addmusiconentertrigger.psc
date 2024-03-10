ScriptName MQ_AddMusicOnEnterTrigger Extends ObjectReference Const
{ Script used for adding Music if the Player enters this trigger }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Required_Properties
  MusicType Property MusicToAdd Auto Const
  { The Music you are trying to play. }
EndGroup

Group Optional_Properties
  Bool Property DeleteWhenTriggered = True Auto Const
  { Delete this ref when triggered - TRUE by default }
EndGroup


;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    MusicToAdd.Add()
    If DeleteWhenTriggered
      Self.Delete()
    EndIf
  EndIf
EndEvent
