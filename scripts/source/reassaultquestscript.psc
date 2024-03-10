ScriptName REAssaultQuestScript Extends Quest
{ Script for REAssault aliases. }

;-- Variables ---------------------------------------
Actor Attacker01Act
Actor Attacker02Act
Actor Attacker03Act
Actor Attacker04Act
Actor Attacker05Act
Actor Defender01Act
Actor Defender02Act
Actor Defender03Act
Actor Defender04Act
Actor Defender05Act
Bool assaultComplete = False

;-- Properties --------------------------------------
ReferenceAlias Property Attacker01Links Auto
ReferenceAlias Property Attacker02Links Auto
ReferenceAlias Property Attacker03Links Auto
ReferenceAlias Property Attacker04Links Auto
ReferenceAlias Property Attacker05Links Auto
ReferenceAlias Property Defender01Links Auto
ReferenceAlias Property Defender02Links Auto
ReferenceAlias Property Defender03Links Auto
ReferenceAlias Property Defender04Links Auto
ReferenceAlias Property Defender05Links Auto
Faction Property REAssaultFactionFriend Auto
ActorValue Property REAssaultRole Auto

;-- Functions ---------------------------------------

Function InitAssault()
  If assaultComplete
    Return 
  EndIf
  Attacker01Act = Attacker01Links.GetActorRef()
  Attacker02Act = Attacker02Links.GetActorRef()
  Attacker03Act = Attacker03Links.GetActorRef()
  Attacker04Act = Attacker04Links.GetActorRef()
  Attacker05Act = Attacker05Links.GetActorRef()
  Defender01Act = Defender01Links.GetActorRef()
  Defender02Act = Defender02Links.GetActorRef()
  Defender03Act = Defender03Links.GetActorRef()
  Defender04Act = Defender04Links.GetActorRef()
  Defender05Act = Defender05Links.GetActorRef()
  If Attacker01Act != None
    Attacker01Act.SetValue(REAssaultRole, 1.0)
    Attacker01Act.EvaluatePackage(False)
  EndIf
  If Attacker02Act != None
    Attacker02Act.SetValue(REAssaultRole, 1.0)
    Attacker02Act.EvaluatePackage(False)
  EndIf
  If Attacker03Act != None
    Attacker03Act.SetValue(REAssaultRole, 1.0)
    Attacker03Act.EvaluatePackage(False)
  EndIf
  If Attacker04Act != None
    Attacker04Act.SetValue(REAssaultRole, 1.0)
    Attacker04Act.EvaluatePackage(False)
  EndIf
  If Attacker05Act != None
    Attacker05Act.SetValue(REAssaultRole, 1.0)
    Attacker05Act.EvaluatePackage(False)
  EndIf
  If Defender01Act != None
    Defender01Act.SetValue(REAssaultRole, 0.0)
    Defender01Act.EvaluatePackage(False)
  EndIf
  If Defender02Act != None
    Defender02Act.SetValue(REAssaultRole, 0.0)
    Defender02Act.EvaluatePackage(False)
  EndIf
  If Defender03Act != None
    Defender03Act.SetValue(REAssaultRole, 0.0)
    Defender03Act.EvaluatePackage(False)
  EndIf
  If Defender04Act != None
    Defender04Act.SetValue(REAssaultRole, 0.0)
    Defender04Act.EvaluatePackage(False)
  EndIf
  If Defender05Act != None
    Defender05Act.SetValue(REAssaultRole, 0.0)
    Defender05Act.EvaluatePackage(False)
  EndIf
EndFunction

Function StartAssault()
  If Attacker01Act != None
    Attacker01Act.SetValue(REAssaultRole, 2.0)
    Attacker01Act.RemoveFromFaction(REAssaultFactionFriend)
    Attacker01Act.EvaluatePackage(False)
  EndIf
  If Attacker02Act != None
    Attacker02Act.SetValue(REAssaultRole, 2.0)
    Attacker02Act.RemoveFromFaction(REAssaultFactionFriend)
    Attacker02Act.EvaluatePackage(False)
  EndIf
  If Attacker03Act != None
    Attacker03Act.SetValue(REAssaultRole, 2.0)
    Attacker03Act.RemoveFromFaction(REAssaultFactionFriend)
    Attacker03Act.EvaluatePackage(False)
  EndIf
  If Attacker04Act != None
    Attacker04Act.SetValue(REAssaultRole, 2.0)
    Attacker04Act.RemoveFromFaction(REAssaultFactionFriend)
    Attacker04Act.EvaluatePackage(False)
  EndIf
  If Attacker05Act != None
    Attacker05Act.SetValue(REAssaultRole, 2.0)
    Attacker05Act.RemoveFromFaction(REAssaultFactionFriend)
    Attacker05Act.EvaluatePackage(False)
  EndIf
  If Defender01Act != None
    Defender01Act.RemoveFromFaction(REAssaultFactionFriend)
    Defender01Act.EvaluatePackage(False)
  EndIf
  If Defender02Act != None
    Defender02Act.RemoveFromFaction(REAssaultFactionFriend)
    Defender02Act.EvaluatePackage(False)
  EndIf
  If Defender03Act != None
    Defender03Act.RemoveFromFaction(REAssaultFactionFriend)
    Defender03Act.EvaluatePackage(False)
  EndIf
  If Defender04Act != None
    Defender04Act.RemoveFromFaction(REAssaultFactionFriend)
    Defender04Act.EvaluatePackage(False)
  EndIf
  If Defender05Act != None
    Defender05Act.RemoveFromFaction(REAssaultFactionFriend)
    Defender05Act.EvaluatePackage(False)
  EndIf
EndFunction

Function CompleteAssault()
  assaultComplete = True
  If Attacker01Act != None
    Attacker01Act.SetValue(REAssaultRole, 0.0)
  EndIf
  If Attacker02Act != None
    Attacker02Act.SetValue(REAssaultRole, 0.0)
  EndIf
  If Attacker03Act != None
    Attacker03Act.SetValue(REAssaultRole, 0.0)
  EndIf
  If Attacker04Act != None
    Attacker04Act.SetValue(REAssaultRole, 0.0)
  EndIf
  If Attacker05Act != None
    Attacker05Act.SetValue(REAssaultRole, 0.0)
  EndIf
  Utility.Wait(0.5)
  If Attacker01Act != None
    Attacker01Act.EvaluatePackage(False)
  EndIf
  If Attacker02Act != None
    Attacker02Act.EvaluatePackage(False)
  EndIf
  If Attacker03Act != None
    Attacker03Act.EvaluatePackage(False)
  EndIf
  If Attacker04Act != None
    Attacker04Act.EvaluatePackage(False)
  EndIf
  If Attacker05Act != None
    Attacker05Act.EvaluatePackage(False)
  EndIf
EndFunction

Function CleanupAssault()
  Attacker01Act = None
  Attacker02Act = None
  Attacker03Act = None
  Attacker04Act = None
  Attacker05Act = None
  Defender01Act = None
  Defender02Act = None
  Defender03Act = None
  Defender04Act = None
  Defender05Act = None
EndFunction
