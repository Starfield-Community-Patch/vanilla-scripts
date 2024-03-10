ScriptName TestMiningPrototype02Script Extends ObjectReference
{ Allow player to loot ore once deposit has "broken up" }

;-- Variables ---------------------------------------
Bool CanLootOre = False
Int MineralAmount = 6
Int SoundInstanceID

;-- Properties --------------------------------------
Faction Property CurrentCompanionFaction Auto Const mandatory
MiscObject Property MineralType Auto Const mandatory
EffectShader Property MiningShader Auto Const
Weapon Property MiningWeapon Auto Const mandatory
Message Property TestMiningPrototypeMSG Auto Const mandatory
wwiseevent Property FXMineOreIronALPMEvent Auto Const mandatory
wwiseevent Property FXMineOreIronBBreakEvent Auto Const mandatory

;-- Functions ---------------------------------------

Function myRegisterForHit()
  Self.RegisterForHitEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, None, None, -1, -1, -1, -1, True)
  Self.RegisterForHitEvent(Self as ScriptObject, CurrentCompanionFaction as ScriptObject, None, None, -1, -1, -1, -1, True)
EndFunction

Event OnLoad()
  Self.myRegisterForHit()
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  If akSource == MiningWeapon as Form
    Self.DamageObject(1.100000024)
  Else
    TestMiningPrototypeMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    Self.myRegisterForHit()
  EndIf
EndEvent

Event OnDestructionStageChanged(Int aiOldStage, Int aiCurrentStage)
  If aiCurrentStage == 2
    If MiningShader
      MiningShader.play(Self as ObjectReference, -1.0)
      SoundInstanceID = FXMineOreIronALPMEvent.play(Self as ObjectReference, None, None)
    EndIf
  EndIf
  If aiCurrentStage >= 3
    CanLootOre = True
    wwiseevent.StopInstance(SoundInstanceID)
    FXMineOreIronBBreakEvent.play(Self as ObjectReference, None, None)
    Utility.Wait(0.200000003)
    MiningShader.stop(Self as ObjectReference)
  EndIf
EndEvent

Event OnActivate(ObjectReference akActionRef)
  If (akActionRef == Game.GetPlayer() as ObjectReference) && CanLootOre == False
    TestMiningPrototypeMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Else
    Self.Disable(False)
    akActionRef.AddItem(MineralType as Form, MineralAmount, False)
  EndIf
EndEvent
