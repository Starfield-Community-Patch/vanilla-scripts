ScriptName TestMovementAnim Extends Actor

;-- Variables ---------------------------------------
Float fcircleStrafeTime = 5.0
Float fjogSpeed = 1.5
Float floopingTurnTime = 5.0
Float frampTime = 0.25
Float frunSpeed = 2.0
Float fslowWalkSpeed = 0.5
Float fstrafingTime = 3.0
Float ftestTurningAtSpeed = 5.0
Float fwalkSpeed = 1.0

;-- Functions ---------------------------------------

Function RunAllTests()
  Self.RunStrafingTest()
  Utility.Wait(2.0)
  Self.RunLoopingTurnTest()
  Utility.Wait(2.0)
  Self.RunTurningTest()
  Utility.Wait(2.0)
  Self.RunMoveAndTurnToTurnInPlaceTests()
  Utility.Wait(2.0)
  Self.RunCircleStrafeTest()
  Utility.Wait(2.0)
  Self.RunSwervingTest()
  Utility.Wait(2.0)
  Self.RunRampingTest()
  Utility.Wait(2.0)
  Self.RunBlendTests()
  Utility.Wait(2.0)
  Self.RunTurnAroundWhileMovingTest()
EndFunction

Function RunAllTestsNoStrafe()
  Self.RunForwardBackwardTest()
  Self.RunLoopingTurnTest()
  Utility.Wait(2.0)
  Self.RunTurningTest()
  Utility.Wait(2.0)
  Self.RunMoveAndTurnToTurnInPlaceTests()
  Utility.Wait(2.0)
  Self.RunSwervingTest()
  Utility.Wait(2.0)
  Self.RunRampingTest()
  Utility.Wait(2.0)
  Self.RunBlendTests()
EndFunction

Function RunStrafingTest()
  Self.TestStrafingAtSpeed(fslowWalkSpeed)
  Self.TestStrafingAtSpeed(fwalkSpeed)
  Self.TestStrafingAtSpeed(fjogSpeed)
  Self.TestStrafingAtSpeed(frunSpeed)
EndFunction

Function RunForwardBackwardTest()
  Self.TestForwardBackwardAtSpeed(fslowWalkSpeed)
  Self.TestForwardBackwardAtSpeed(fwalkSpeed)
  Self.TestForwardBackwardAtSpeed(fjogSpeed)
  Self.TestForwardBackwardAtSpeed(frunSpeed)
EndFunction

Function RunLoopingTurnTest()
  Self.TestLoopingTurn(fslowWalkSpeed)
  Self.TestLoopingTurn(-fslowWalkSpeed)
  Self.TestLoopingTurn(fwalkSpeed)
  Self.TestLoopingTurn(-fwalkSpeed)
  Self.TestLoopingTurn(fjogSpeed)
  Self.TestLoopingTurn(-fjogSpeed)
  Self.TestLoopingTurn(frunSpeed)
  Self.TestLoopingTurn(-frunSpeed)
EndFunction

Function RunTurningTest()
  Self.RunTurningAtSpeedTest(fslowWalkSpeed)
  Self.RunTurningAtSpeedTest(fwalkSpeed)
  Self.RunTurningAtSpeedTest(fjogSpeed)
  Self.RunTurningAtSpeedTest(frunSpeed)
EndFunction

Function RunTurningAtSpeedTest(Float afSpeed)
  Self.TestTurningAtSpeed(afSpeed, fslowWalkSpeed)
  Self.TestTurningAtSpeed(afSpeed, fwalkSpeed)
  Self.TestTurningAtSpeed(afSpeed, fjogSpeed)
  Self.TestTurningAtSpeed(afSpeed, frunSpeed)
EndFunction

Function RunCircleStrafeTest()
  Self.TestCircleStrafingAtSpeed(fslowWalkSpeed)
  Self.TestCircleStrafingAtSpeed(fwalkSpeed)
  Self.TestCircleStrafingAtSpeed(fjogSpeed)
  Self.TestCircleStrafingAtSpeed(frunSpeed)
  Self.TestCircleStrafingAtSpeed(fslowWalkSpeed)
  Self.TestCircleStrafingAtSpeed(fwalkSpeed)
  Self.TestCircleStrafingAtSpeed(fjogSpeed)
  Self.TestCircleStrafingAtSpeed(frunSpeed)
EndFunction

Function RunTurnAroundWhileMovingTest()
  Self.TestTurnAroundWhileAtSpeed(fslowWalkSpeed)
  Self.TestTurnAroundWhileAtSpeed(fwalkSpeed)
  Self.TestTurnAroundWhileAtSpeed(fjogSpeed)
  Self.TestTurnAroundWhileAtSpeed(frunSpeed)
EndFunction

Function RunSwervingTest()
  Self.RunSwervingTestAtMoveSpeed(fslowWalkSpeed)
  Self.RunSwervingTestAtMoveSpeed(fwalkSpeed)
  Self.RunSwervingTestAtMoveSpeed(fjogSpeed)
  Self.RunSwervingTestAtMoveSpeed(frunSpeed)
EndFunction

Function RunSwervingTestAtMoveSpeed(Float afMoveSpeed)
  Self.TestSwervingAtSpeed(afMoveSpeed, fslowWalkSpeed)
  Self.TestSwervingAtSpeed(afMoveSpeed, fwalkSpeed)
  Self.TestSwervingAtSpeed(afMoveSpeed, fjogSpeed)
  Self.TestSwervingAtSpeed(afMoveSpeed, frunSpeed)
EndFunction

Function RunRampingTest()
  Self.RunRampingTestBetweenSpeeds(0.0, fslowWalkSpeed)
  Self.RunRampingTestBetweenSpeeds(0.0, frunSpeed)
  Self.RunRampingTestBetweenSpeeds(0.0, frunSpeed)
  Self.RunRampingTestBetweenSpeeds(fslowWalkSpeed, fwalkSpeed)
  Self.RunRampingTestBetweenSpeeds(fwalkSpeed, fjogSpeed)
  Self.RunRampingTestBetweenSpeeds(fjogSpeed, frunSpeed)
  Self.RunRampingTestBetweenSpeeds(fwalkSpeed, frunSpeed)
EndFunction

Function RunRampingTestBetweenSpeeds(Float afMinSpeed, Float afMaxSpeed)
  Self.TestRampSpeed(afMinSpeed, afMaxSpeed, 1.0, 3)
  Self.TestRampSpeed(afMinSpeed, afMaxSpeed, 0.5, 5)
  Self.TestRampSpeed(afMinSpeed, afMaxSpeed, 0.25, 10)
EndFunction

Function RunBlendTests()
  Self.TestForwardAndTurnBlends(fwalkSpeed - 0.100000001, 0.0, 0.01)
  Self.TestForwardAndTurnBlends(fjogSpeed - 0.100000001, 0.0, 0.01)
  Self.TestForwardAndTurnBlends(frunSpeed - 0.100000001, 0.0, 0.01)
EndFunction

Function RunMoveAndTurnToTurnInPlaceTests()
  Self.TestMoveThenTurn(fslowWalkSpeed, fslowWalkSpeed)
  Self.TestMoveThenTurn(fwalkSpeed, fwalkSpeed)
  Self.TestMoveThenTurn(fjogSpeed, fjogSpeed)
  Self.TestMoveThenTurn(frunSpeed, frunSpeed)
EndFunction

Function RampSpeed(Float afAngle, Float afSpeed, Float afTime, Float afRampUpTime, Float afRampDownTime)
  Utility.Wait(afTime - afRampDownTime)
  Utility.Wait(afRampDownTime)
EndFunction

Function TestStrafingAtSpeed(Float afSpeed)
  Float fangle = 0.0
  Float fangleInc = 45.0
  While fangle < 360.0
    Self.RampSpeed(fangle, afSpeed, fstrafingTime, frampTime, frampTime)
    Self.RampSpeed(fangle + 180.0, afSpeed, fstrafingTime, frampTime, frampTime)
    fangle += fangleInc
  EndWhile
  Utility.Wait(frampTime)
  fangle = 0.0
  fangleInc = 10.0
  Float fdeltaTime = fcircleStrafeTime * fangleInc / 360.0
  While fangle < 360.0
    Utility.Wait(fdeltaTime)
    fangle += fangleInc
  EndWhile
  Utility.Wait(frampTime)
  Utility.Wait(frampTime)
  fangle = 360.0
  While fangle > 0.0
    Utility.Wait(fdeltaTime)
    fangle -= fangleInc
  EndWhile
  Utility.Wait(frampTime)
EndFunction

Function TestForwardBackwardAtSpeed(Float afSpeed)
  Self.RampSpeed(0.0, afSpeed, fstrafingTime, frampTime, frampTime)
  Self.RampSpeed(180.0, afSpeed, fstrafingTime, frampTime, frampTime)
EndFunction

Function TestLoopingTurn(Float afSpeed)
  Utility.Wait(floopingTurnTime - frampTime)
  Utility.Wait(frampTime)
EndFunction

Function TestTurningAtSpeed(Float afSpeed, Float afTurnSpeed)
  Utility.Wait(ftestTurningAtSpeed - frampTime)
  Utility.Wait(frampTime)
  Utility.Wait(ftestTurningAtSpeed - frampTime)
  Utility.Wait(frampTime)
EndFunction

Function TestCircleStrafingAtSpeed(Float afSpeed)
  Utility.Wait(fcircleStrafeTime - frampTime)
  Utility.Wait(frampTime)
  Utility.Wait(fcircleStrafeTime - frampTime)
  Utility.Wait(frampTime)
EndFunction

Function TestTurnAroundWhileAtSpeed(Float afMoveSpeed)
  Utility.Wait(2.0)
  Float fangle = 0.0
  Float fangleInc = 10.0
  Float fdeltaTime = 2.0 * fangleInc / 360.0
  While fangle < 360.0
    Utility.Wait(fdeltaTime)
    fangle += fangleInc
  EndWhile
  Utility.Wait(frampTime)
  Utility.Wait(2.0)
  fangle = 360.0
  fangleInc = 10.0
  fdeltaTime = 2.0 * fangleInc / 360.0
  While fangle > 0.0
    Utility.Wait(fdeltaTime)
    fangle -= fangleInc
  EndWhile
  Utility.Wait(frampTime)
  Utility.Wait(2.0)
  Utility.Wait(frampTime)
EndFunction

Function TestRampSpeed(Float afMinSpeed, Float afMaxSpeed, Float afRampTime, Int icount)
  Utility.Wait(frampTime)
  Int I = 0
  While I < icount
    Utility.Wait(afRampTime)
    Utility.Wait(afRampTime)
    I += 1
  EndWhile
  Utility.Wait(frampTime)
EndFunction

Function TestSwervingAtSpeed(Float afMoveSpeed, Float afSwerveSpeed)
  Utility.Wait(frampTime)
  Int icount = 0
  While icount < 10
    Utility.Wait(frampTime)
    Utility.Wait(frampTime)
    icount += 1
  EndWhile
  Utility.Wait(frampTime)
EndFunction

Function TestForwardAndTurnBlends(Float afMoveSpeed, Float afTurnSpeed, Float afTurnSpeedDelta)
  Utility.Wait(frampTime)
  Int icount = 0
  While icount < 10
    Utility.Wait(Utility.RandomFloat(0.100000001, 0.5))
    Utility.Wait(Utility.RandomFloat(0.100000001, 0.5))
    Utility.Wait(Utility.RandomFloat(0.100000001, 0.5))
    Utility.Wait(Utility.RandomFloat(0.100000001, 0.5))
    icount += 1
  EndWhile
  Utility.Wait(frampTime)
EndFunction

Function TestMoveThenTurn(Float afMoveSpeed, Float afTurnSpeed)
  Self.TestMoveInDirectionThenTurn(0.0, afMoveSpeed, afTurnSpeed)
  Self.TestMoveInDirectionThenTurn(0.0, afMoveSpeed, -afTurnSpeed)
  Self.TestMoveInDirectionThenTurn(180.0, afMoveSpeed, afTurnSpeed)
  Self.TestMoveInDirectionThenTurn(180.0, afMoveSpeed, -afTurnSpeed)
EndFunction

Function TestMoveInDirectionThenTurn(Float afDirection, Float afMoveSpeed, Float afTurnSpeed)
  Utility.Wait(1.0)
  Utility.Wait(1.0)
  Utility.Wait(2.0)
  Utility.Wait(frampTime)
EndFunction

Function RunDirectionSmoothingTest()
  Game.SetCameraTarget(Self as Actor)
  Utility.Wait(5.0)
  Self.TestDirectionSmoothingAtSpeed(fslowWalkSpeed)
  Self.TestDirectionSmoothingAtSpeed(fwalkSpeed)
  Self.TestDirectionSmoothingAtSpeed(fjogSpeed)
  Self.TestDirectionSmoothingAtSpeed(frunSpeed)
EndFunction

Function TestDirectionSmoothingAtSpeed(Float afSpeed)
  Float fangle = 0.0
  Float fangleInc = 45.0
  While fangle < 360.0
    Utility.Wait(3.0)
    Utility.Wait(3.0)
    fangle += fangleInc
  EndWhile
  Utility.Wait(1.0)
EndFunction
