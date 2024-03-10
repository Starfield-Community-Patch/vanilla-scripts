ScriptName FWQuestScript Extends Quest
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
ReferenceAlias Property Attacker01 Auto
ReferenceAlias Property Attacker02 Auto
ReferenceAlias Property Attacker03 Auto
ReferenceAlias Property Attacker04 Auto
ReferenceAlias Property Attacker05 Auto
ReferenceAlias Property Defender01 Auto
ReferenceAlias Property Defender02 Auto
ReferenceAlias Property Defender03 Auto
ReferenceAlias Property Defender04 Auto
ReferenceAlias Property Defender05 Auto
ReferenceAlias Property Attacker01Marker Auto
ReferenceAlias Property Attacker02Marker Auto
ReferenceAlias Property Attacker03Marker Auto
ReferenceAlias Property Attacker04Marker Auto
ReferenceAlias Property Attacker05Marker Auto
ReferenceAlias Property Defender01Marker Auto
ReferenceAlias Property Defender02Marker Auto
ReferenceAlias Property Defender03Marker Auto
ReferenceAlias Property Defender04Marker Auto
ReferenceAlias Property Defender05Marker Auto
ActorBase Property TestFWEncMinutemen Auto
ActorBase Property TestFWEncBoS Auto
ActorBase Property TestFWEncRR Auto
ActorBase Property TestFWEncInstitute Auto
ActorBase Property TestFWEncRaider Auto
ActorBase Property TestFWEncSuperMutant Auto
ActorBase Property TestFWEncGunner Auto
Keyword Property FWOwner Auto
{ This tracks which faction own this location
0 = no one
1 = Minutemen
2 = Brotherhood of Steel
3 = Railroad
4 = Institute
5 = Raiders
6 = Supermutants
7 = Gunners }
Keyword Property FWAttacker Auto
{ This tracks which faction is attacking this location
0 = no one
1 = Minutemen
2 = Brotherhood of Steel
3 = Railroad
4 = Institute
5 = Raiders
6 = Supermutants
7 = Gunners }
Float Property Attacker Auto hidden
Float Property Defender Auto hidden
LocationAlias Property MyLocation Auto
Int Property _DefenderOverride = 0 Auto
Int Property _AttackerOverride = 0 Auto
ActorValue Property FWIsAttacker Auto

;-- Functions ---------------------------------------

Function InitAssault()
  If assaultComplete
    Return 
  EndIf
  If _AttackerOverride >= 0 || _DefenderOverride >= 0
    Self.SetFactionOverrrides()
  EndIf
  Self.SpawnDefenders()
  Self.SpawnAttackers()
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
    Attacker01Act.SetValue(FWIsAttacker, 1.0)
    Attacker01Act.EvaluatePackage(False)
  EndIf
  If Attacker02Act != None
    Attacker02Act.SetValue(FWIsAttacker, 1.0)
    Attacker02Act.EvaluatePackage(False)
  EndIf
  If Attacker03Act != None
    Attacker03Act.SetValue(FWIsAttacker, 1.0)
    Attacker03Act.EvaluatePackage(False)
  EndIf
  If Attacker04Act != None
    Attacker04Act.SetValue(FWIsAttacker, 1.0)
    Attacker04Act.EvaluatePackage(False)
  EndIf
  If Attacker05Act != None
    Attacker05Act.SetValue(FWIsAttacker, 1.0)
    Attacker05Act.EvaluatePackage(False)
  EndIf
  If Defender01Act != None
    Defender01Act.SetValue(FWIsAttacker, 0.0)
    Defender01Act.EvaluatePackage(False)
  EndIf
  If Defender02Act != None
    Defender02Act.SetValue(FWIsAttacker, 0.0)
    Defender02Act.EvaluatePackage(False)
  EndIf
  If Defender03Act != None
    Defender03Act.SetValue(FWIsAttacker, 0.0)
    Defender03Act.EvaluatePackage(False)
  EndIf
  If Defender04Act != None
    Defender04Act.SetValue(FWIsAttacker, 0.0)
    Defender04Act.EvaluatePackage(False)
  EndIf
  If Defender05Act != None
    Defender05Act.SetValue(FWIsAttacker, 0.0)
    Defender05Act.EvaluatePackage(False)
  EndIf
EndFunction

Function CompleteAssault()
  assaultComplete = True
  If Attacker01Act != None
    Attacker01Act.SetValue(FWIsAttacker, 0.0)
  EndIf
  If Attacker02Act != None
    Attacker02Act.SetValue(FWIsAttacker, 0.0)
  EndIf
  If Attacker03Act != None
    Attacker03Act.SetValue(FWIsAttacker, 0.0)
  EndIf
  If Attacker04Act != None
    Attacker04Act.SetValue(FWIsAttacker, 0.0)
  EndIf
  If Attacker05Act != None
    Attacker05Act.SetValue(FWIsAttacker, 0.0)
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

Function SpawnDefenders()
  If MyLocation.getLocation().GetKeywordData(FWOwner) != 0.0
    Defender = MyLocation.getLocation().GetKeywordData(FWOwner)
  Else
    Defender = Utility.RandomInt(1, 4) as Float
  EndIf
  ActorBase DefenderBase = None
  DefenderBase = Self.SetupFactionActorBase(Defender)
  Int numToSpawn = 5
  Defender01.ForceRefTo(Defender01Marker.GetReference().PlaceActorAtMe(DefenderBase, 0, None, False, False, True, None, True) as ObjectReference)
  Defender02.ForceRefTo(Defender02Marker.GetReference().PlaceActorAtMe(DefenderBase, 0, None, False, False, True, None, True) as ObjectReference)
  Defender03.ForceRefTo(Defender03Marker.GetReference().PlaceActorAtMe(DefenderBase, 0, None, False, False, True, None, True) as ObjectReference)
  Defender04.ForceRefTo(Defender04Marker.GetReference().PlaceActorAtMe(DefenderBase, 0, None, False, False, True, None, True) as ObjectReference)
  Defender05.ForceRefTo(Defender05Marker.GetReference().PlaceActorAtMe(DefenderBase, 0, None, False, False, True, None, True) as ObjectReference)
EndFunction

Function SpawnAttackers()
  If MyLocation.getLocation().GetKeywordData(FWAttacker) != 0.0
    Attacker = MyLocation.getLocation().GetKeywordData(FWAttacker)
  Else
    Attacker = Utility.RandomInt(1, 4) as Float
    While Attacker == Defender
      Attacker = Utility.RandomInt(1, 4) as Float
    EndWhile
  EndIf
  ActorBase AttackerBase = None
  AttackerBase = Self.SetupFactionActorBase(Attacker)
  Attacker01.ForceRefTo(Attacker01Marker.GetReference().PlaceActorAtMe(AttackerBase, 0, None, False, False, True, None, True) as ObjectReference)
  Attacker02.ForceRefTo(Attacker02Marker.GetReference().PlaceActorAtMe(AttackerBase, 0, None, False, False, True, None, True) as ObjectReference)
  Attacker03.ForceRefTo(Attacker03Marker.GetReference().PlaceActorAtMe(AttackerBase, 0, None, False, False, True, None, True) as ObjectReference)
  Attacker04.ForceRefTo(Attacker04Marker.GetReference().PlaceActorAtMe(AttackerBase, 0, None, False, False, True, None, True) as ObjectReference)
  Attacker05.ForceRefTo(Attacker05Marker.GetReference().PlaceActorAtMe(AttackerBase, 0, None, False, False, True, None, True) as ObjectReference)
EndFunction

ActorBase Function SetupFactionActorBase(Float FactionNumber)
  If FactionNumber == 1.0
    Return TestFWEncMinutemen
  ElseIf FactionNumber == 2.0
    Return TestFWEncBoS
  ElseIf FactionNumber == 3.0
    Return TestFWEncRR
  ElseIf FactionNumber == 4.0
    Return TestFWEncInstitute
  ElseIf FactionNumber == 5.0
    Return TestFWEncRaider
  ElseIf FactionNumber == 6.0
    Return TestFWEncSuperMutant
  ElseIf FactionNumber == 7.0
    Return TestFWEncGunner
  EndIf
EndFunction

Function SetFactionOverrrides()
  If _AttackerOverride >= 0
    MyLocation.getLocation().SetKeywordData(FWAttacker, _AttackerOverride as Float)
  EndIf
  If _DefenderOverride >= 0
    MyLocation.getLocation().SetKeywordData(FWOwner, _DefenderOverride as Float)
  EndIf
EndFunction
