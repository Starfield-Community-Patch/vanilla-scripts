ScriptName DefaultSetAVTrigScript Extends ObjectReference default
{ Default trigger script that can set the Actor Values (AVs) of one (or a chain of) linked actors when a trigger is entered. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Required_Properties
  ActorValue Property AV01 Auto Const mandatory
  { First Actor Value to set. }
  Float Property AV01_Value Auto Const mandatory
  { First Actor Value's new value. }
EndGroup

Group Optional_Properties
  ActorValue Property AV02 Auto Const
  { Second Actor Value to set. }
  Float Property AV02_Value Auto Const
  { Second Actor Value's new value. }
  ActorValue Property AV03 Auto Const
  { Third Actor Value to set. }
  Float Property AV03_Value Auto Const
  { Third Actor Value's new value. }
  ActorValue Property AV04 Auto Const
  { Fourth Actor Value to set. }
  Float Property AV04_Value Auto Const
  { Fourth Actor Value's new value. }
  ActorValue Property AV05 Auto Const
  { Fifth Actor Value to set. }
  Float Property AV05_Value Auto Const
  { Fifth Actor Value's new value. }
  Bool Property onlyPlayer = True Auto Const
  { Default=TRUE. Only accept trigger events from the player? }
  Bool Property onlyOnce = True Auto Const
  { Default=TRUE. Only set AVs once? If True, disables and deletes the trigger when done. }
  Keyword Property linkKeyword Auto Const
  { Link Keyword for the actor (or chain of actors) whose AVs we're going to set. }
  Int Property maxLinks = 25 Auto Const
  { Maximum number of actors to set AVs on. Acts as a failsafe in case the actors are linked in a loop. }
EndGroup

Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { Default = FALSE, Set to TRUE if you want the traces in this script to show up in the log. }
EndGroup


;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If !onlyPlayer || (akActionRef == Game.GetPlayer() as ObjectReference)
    Self.SetActorValues(Self.GetLinkedRef(linkKeyword) as Actor)
    If onlyOnce
      Self.Disable(False)
      Self.Delete()
    EndIf
  EndIf
EndEvent

Function SetActorValues(Actor akActor)
  Actor current = akActor
  Int I = 0
  While current != None && I < maxLinks
    If AV01 != None
      current.SetValue(AV01, AV01_Value)
    EndIf
    If AV02 != None
      current.SetValue(AV02, AV02_Value)
    EndIf
    If AV03 != None
      current.SetValue(AV03, AV03_Value)
    EndIf
    If AV04 != None
      current.SetValue(AV04, AV04_Value)
    EndIf
    If AV05 != None
      current.SetValue(AV05, AV05_Value)
    EndIf
    current.EvaluatePackage(False)
    I += 1
    current = current.GetLinkedRef(linkKeyword) as Actor
  EndWhile
EndFunction
