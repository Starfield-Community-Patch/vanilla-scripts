ScriptName SQ_TreasureMapSpaceScript Extends SQ_TreasureMapScript
{ for treasure maps leading to space loot }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property TreasureContainersMin = 5 Auto Const
{ min number of "space containers" to create (each will get min/max quantity of Treasure) }
Int Property TreasureContainersMax = 10 Auto Const
{ max number of "space containers" to create (each will get min/max quantity of Treasure) }
