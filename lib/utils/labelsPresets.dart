const commandLabels = [
    "DISABLE",
    "ENABLE",
    "PLAY",
    "Action.signal",
    "QuestState.mount",
    "MiscState.unlockAchievement",
    "MiscState.setvar",
    "QuestState.request_state",
    "SceneStateSystem.set",
    "HackingEnemy.changeMoveType_Eight",
    "UITimerAction.stop",
    "HackingEnemy.changeMoveType_Circle",
    "HackingEnemy.changeMoveType_Reflect",
    "HackingEnemy.setMoveSpeedRate",
    "HackingEnemy.changeMoveType_Stalk",
    "HackingEnemy.changeMoveType_Repeat",
    "HackingEnemy.changeMoveType_HecticChase",
    "RESET",
    "GroupImpl.signal",
    "MiscState.callSe",
    "Pl0000.setNpcFromBuddy",
    "Pl0000.setBuddyFromNpc",
    "Pl0000.setControlHackReturnPos",
    "Pl0000.endControlHackNoBomb",
    "Action.reset",
    "Pl0000.initBehindFreeShooting",
    "BehaviorGate.startClose",
    "BehaviorHacking.startLock",
    "PhaseEventAction.play",
    "MiscState.STA_ON",
    "BehaviorHacking.endLock",
    "Pl0000.callDialogTutorial",
    "BehaviorFlightUnit.setBodyColorWhite",
    "SceneStateSystem.reset",
    "BehaviorAutoDoor.doorLock",
    "Pl0000.setWalkTarget",
    "Pl0000.clearWalkTarget",
    "Pl0000.start9sMoveTo2B",
    "BehaviorAppBase.requestWait",
    "MiscState.GAME_ON",
    "Pl0000.startPhaseEventFlightUnit",
    "Pl0000.startPhaseEventFlightUnitNoWep",
    "PhaseEventAction.releaseData",
    "Pl0000.endPhaseEventFlightUnit",
    "BehaviorDoor.open",
    "Pl0000.endBehindFreeShooting",
    "ScrollMap.setCam_Quater",
    "Pl0000.setShootingPosResetTimer",
    "ScrollMap.setWorldSpd",
    "ScrollMap.setFlightMode_Fighter",
    "MiscState.STP_ON",
    "ScrollMap.setEnd",
    "ScrollMap.setStart",
    "ScrollMap.setCam_QuaterBack",
    "ScrollMap.setFlightMode_Robot",
    "MiscState.GAME_OFF",
    "Em1000.setEm1000DieEnable",
    "EmBase.addExpDirect",
    "EmBase.unlockEmList",
    "Pl0000.setShootingFrontOver",
    "ScrollMap.setFlightMode_FighterReset",
    "PlayerTurnOffAction.startBack",
    "Pl0000.onEm3000TopViewCamera",
    "Pl0000.offEm3000TopViewCamera",
    "ScrollMap.setWorldYInter_Norm",
    "Em1100.enableBridgeBreak",
    "Pl0000.startPodMoveMode",
    "Pl0000.setE3TimeTrial",
    "MiscState.debugPhaseJump",
    "Behavior.setHackingStageLabelByHap",
    "EmBase.startDispHpBar",
    "Pl0000.setFlightUnitWhite",
    "Pl0000.start9SEm3000Hacking",
    "Pl0000.end2BBreak",
    "BehaviorAnim.open",
    "MiscState.STP_OFF",
    "ScrollMap.offLoop",
    "Pl0000.setPosRotResetHap",
    "Pl0000.setRunTarget",
    "Pl0000.clearRunTarget",
    "Pl0000.set2BBreakWeak",
    "Pl0000.initEm1100FlightBattle",
    "EmBase.offHackingEnable",
    "ScrollMap.setCam_Side",
    "Pl0000.onNPCShootingFreePlay",
    "Behavior.setSuspend",
    "Ba0011.onStopMode",
    "Pl0000.setEventMuteki",
    "ScrollMap.setWorldYInter_Ess",
    "ScrollMap.setCam_Behind",
    "Behavior.terminate",
    "BehaviorAppBase.pullout",
    "EmBase.onHackingEnable",
    "SceneStateSystem.clearGroup",
    "Pl0000.dispWeaponOut",
    "EnemyGenerator.deactivate",
    "SoundNovelAction.jumpTo",
    "Behavior.clearHackingStageLabel",
    "Pl0000.onCameraBigShakeEff",
    "SoundNovelAction.close",
    "FadeAction.fadeKill",
    "Pl0000.initEm1100FinalFlightBattle",
    "ScrollMap.setObjYInter_Ess",
    "Pl0000.clearShootingPosResetTimer",
    "BehaviorAnim.close",
    "Em1100.setP4After",
    "Pl0000.setNPCShootingPosOutTimer",
    "Em1100.setP3MoveStart",
    "ScrollMap.changeNextMap",
    "EmBase.setHpFromRate",
    "Pl0000.setShootingSideOverSlow",
    "Pl0000.clearShootingSideOver",
    "MiscState.STA_OFF",
    "Em1100.enableSTG",
    "Pl0000.changeFlightUnitBlackToWhite",
    "Pl0000.offFlightUnitMissilePod",
    "Pl0000.dispWeaponIn",
    "BehaviorAppBase.setTalkDisable",
    "BunkerAction.exitSp",
    "Pl0000.set9sBreakWeak",
    "Pl0000.end9sBreak",
    "Em1100.resetPlayerPos",
    "Pl0000.endPodMoveMode",
    "Em1100.onAlphaArmTrans_R",
    "Em1100.offArmTrans_R",
    "BehaviorC4Bomb.doit",
    "BehaviorBh.callBreak",
    "Pl0000.endEm1100FlightBattle",
    "EmBase.forceSandApeear",
    "Pl0000.endEm1100FinalFlightBattle",
    "Pl0000.startLaserKill",
    "ScrollMap.setCam_Top",
    "Pl0000.startShootingNPCMove",
    "Pl0000.setNPCShootingHuman",
    "EmBase.onAlwaysSuerArmor",
    "EmBase.setSandDiveEscape",
    "EmBase.setSandAppearWaitClear",
    "EmBase.setGoPoint",
    "EmBase.setTargetIcon",
    "Em1100.onWarEff",
    "Em1100.offWarEff",
    "Em1100.onAttackGun",
    "Em1100.offAttackGun",
    "Em1100.setBuildBreak",
    "Pl0013.startGoAway",
    "Em1100.offAlphaArmTrans_L",
    "Em1100.onAlphaArmTrans_L",
    "EmBase.setSurpriseB",
    "Pl0000.setNPCShootingFighter",
    "Bg0130.offLight",
    "Em1100.offAlphaArmTrans_R",
    "Pl0000.setShootingCamBehind",
    "Em3000.setFinale",
    "ScrollMap.setGateAnimSpd",
    "Pl0000.setShootingCamQuater",
    "cPf30.startStaffroll",
    "EmBase.setForceWalk",
    "BehaviorTransporterBa.lock",
    "BehaviorTransporterBa.unlock",
    "BehaviorAppBase.setTalkEnable",
    "NPC.changeSetTypeFollow",
    "NPC.setPl1020Close9s",
    "Pl0000.resetNPCShootingPos",
    "Em8000.setEm80000WallJumpAppear",
    "NPC.setPl1000JetComeOut",
    "Bga201.setBrinkPowerOff",
    "Em8000.offEm8000Barrier",
    "Pl0000.setRobotRescueStartLocation",
    "BehaviorElevDoor.callEv",
    "Pl0000.setHackingDownLoop",
    "Pl0000.endControlHack",
    "Pl0000.onVSCameraAlienShip",
    "Pl0000.setGoggleOff",
    "Pl0000.set2BBreak",
    "Pl0000.set9sBreak",
    "Pl0000.offVSCameraAlienShip",
    "BehaviorBg.callSEformObj",
    "Pl0000.setNpcAtkWaitOnly",
    "MiscState.DBG_ON",
    "Pl0000.endEm4000FlightBattle",
    "Em4000.setEm0030Random",
    "Pl0000.set2BBreakEvent",
    "Pl0000.setShootingCamTop",
    "Em5000.em5000Vanish",
    "Pl0000.initEm4000FlightBattle",
    "Pl0000.start9sLast",
    "ScrollMap.setObjYInter_Norm",
    "Em4000.setActionC",
    "Em4000.setActionA",
    "Em4000.openMouth",
    "Em4000.setActionB",
    "Em5000.em5000AtkEnable",
    "Em5000.em5000SideViewWarpA",
    "Em5000.em5000SideViewWarpB",
    "Pl0000.setNPC2BArtillery",
    "Bunker.onEff_Alert",
    "Bunker.offEff_Alert",
    "Pl0000.shotNPC2BArtillery",
    "Pl0000.setCorpse",
    "Pl0000.startTo9sRun",
    "Pl0000.setRobotRescueWakeUp",
    "Pl0000.onVSCamera",
    "Pl0000.setBattleWait",
    "Pl0000.setNpcAtkWait",
    "Pl0000.setNpcBattle",
    "Pl0000.offVSCamera",
    "Pl0000.setBedSelfHackingRtn",
    "Pl0000.clearGetOnFlightUnit",
    "Em4000.setEm0030Route04",
    "Em4000.setEm0030Route05",
    "Em4000.setEm0030Route02",
    "Em4000.setEm0030Route03",
    "Em4000.setEm0030Type03",
    "Em4000.setEm0030Type00",
    "Em4000.setEm0030Type01",
    "Em4000.setEm0030Type02",
    "Em4000.setEm0030Route00",
    "Em4000.setEm0030Route01",
    "Em4000.setEm0030Route06",
    "Em4000.setEm0030Route07",
    "ElevatorAction.lock",
    "ElevatorAction.unlock",
    "EmBase.setDownLoop",
    "NPC.setPl1000BuddyFromNPC",
    "Em5000.em5000TalkEnd",
    "LOAD",
    "Pl0000.setShootingCamSide",
    "Bg4021.setEm0030Random",
    "Bg4021.setEm0030Type03",
    "Bg4021.setEm0030Type01",
    "Bg4021.setEm0030Route04",
    "Bg4021.setEm0030Route05",
    "Bg4021.setEm0030Route06",
    "Bg4021.setEm0030Route07",
    "Bg4021.setEm0030Type00",
    "Pl0000.startAirShipBoss",
    "Pl0000.start2BMoveTo9S",
    "EmBase.offAlwaysSuerArmor",
    "EmBase.onDmgScared",
    "EmBase.offDmgScared",
    "LoopElevatorAction.unlockEv",
    "LoopElevatorAction.outEvSWFloor1",
    "Pl0000.onCameraShakeEff",
    "Pl0000.onBattleWait",
    "Pl0000.offCameraShakeEff",
    "Pl0000.offBattleWait",
    "Pl0000.setShootingSideOver",
    "Ba0435.setShake",
    "Pl0000.start9SEveHacking",
    "EmBase.changeEnemy",
    "EmBase.setSuicideDrop",
    "EnemyGenerator.setBerserkerLoop",
    "EnemyGenerator.setDieRtnNoDrop",
    "DEACTIVATE",
    "EmBase.setFlagWave",
    "MiscState.DBG_OFF",
    "Pl0000.setDownWait",
    "Pl0000.setDownWakeUp",
    "Em8000.setSTGHpLimit",
    "Pl0000.setHackingFilterCore12",
    "Pl0000.onTowerChangeEff",
    "Pl0000.setTowerShooting",
    "Pl0000.onTowerMode",
    "Pl0000.onVSCameraTowerTop",
    "LoopElevatorAction.upEvTower",
    "Ba0210.unlock",
    "Ba0210.callEv",
    "LoopElevatorAction.lockEv",
    "MiscState.callBgm",
    "Pl0000.enemyDestroyedLocation",
    "Em1090.setEm1090EmpEff",
    "Pl0000.set2BBlackOut",
    "Pl0000.startEventWeapon",
    "Pl0000.setUIPollutionGaugeLv7",
    "Pl0000.set2BDieSe00",
    "Pl0000.endVirusMode",
    "Pl0000.clear2BDieFilter",
    "Pl0000.clearUIPollutionGauge",
    "Pl0000.setPlayerFromNPC",
    "Pl0000.destroyBuddy",
    "Pl0000.onVirusNoRecovery",
    "Pl0000.offVirusNoRecovery",
    "EnemyGenerator.stopSpawn",
    "Ba0210.lock",
    "EmBase.startDispHpBarNoWarning",
    "Pl0000.setFlightUnitEff2Bto9S",
    "Pl0000.setFlightUnitEff2BDamage",
    "Pl0000.setFlightUnitEff2BBomb",
    "Pl0000.setFlightUnitEff2BBombSml",
    "Pl0000.setFlightUnitEff2BStealthOff",
    "Pl0000.offNPCShootingFreePlay",
    "Pl0000.setShootingPosUpResetTimer",
    "Pl0000.offTowerChangeEff",
    "Ba3100.setSpeedFloor0",
    "Ba3100.run",
    "Ba3100.setSpeedFloor1",
    "Ba3100.setSpeedFloor2",
    "Ba3100.setSpeedFloor3",
    "Ba3100.stop",
    "Pl0000.dispWeaponOutNoEff",
    "Pl0000.setSelfHackingDamage",
    "Pl0000.setSelfHacking",
    "Pl0000.offTowerShooting",
    "Pl0000.setBedSit",
    "Pl0000.setBedStandup",
    "Pl0000.changePlayer",
    "Pl0000.setUIPollutionGaugeLv1",
    "Pl0000.set2BDieFilterLv0",
    "Pl0000.setVirusMode",
    "Pl0000.set2BDieSe10",
    "Pl0000.startVirusLv2",
    "Pl0000.setUIPollutionGaugeLv2",
    "Pl0000.set2BDieFilterLv1",
    "Pl0000.set2BDieSe30",
    "Pl0000.setUIPollutionGaugeLv3",
    "Pl0000.setUIPollutionGaugeLv4",
    "Pl0000.set2BDieFilterLv2",
    "Pl0000.set2BDieSe50",
    "Pl0000.setUIPollutionGaugeLv5",
    "Pl0000.set2BDieSe70",
    "Pl0000.setUIPollutionGaugeLv6",
    "Pl0000.set2BDieFilterLv3",
    "Pl0000.set2BDieSe90",
    "Pl0000.endA2Break",
    "NPC.onPascalBattleMode",
    "EmBase.setDieRtn",
    "Pl0000.startA2Tired",
    "Pl0000.setA2Break",
    "FadeAction.fadeOut",
    "FadeAction.fadeIn",
    "Pl0000.startWeakMode",
    "Pl0000.endWeakMode",
    "EmBase.setEm1050DieMove",
    "Pl0000.changePlayerFinalA2",
    "Em1090.startFreeBattleEm1090",
    "Em1090.onStopMoveEm1090",
    "Em1090.offStopMoveEm1090",
    "BehaviorLibraryAccessPoint.setHackingEnable",
    "BehaviorDoor.opened",
    "MiscState.setSuspendGA",
    "Bga201.setPowerOn",
    "MiscState.resetSuspendGA",
    "Em7000.onEm7000Battle",
    "MiscState.seamless_off",
    "BehaviorTowerControl.onEffect",
    "Pl0000.enableFriendlyFire",
    "Pl0000.start9SDefence",
    "Pl0000.start9SDefenceUpload",
    "NPC.dieDevola",
    "Pl0000.offTowerMode",
    "BehaviorAutoDoor.doorOpenLock",
    "PlParts.start",
    "PlParts.headArmorOff",
    "Pl0000.setDownVirus",
    "Pl0000.enableFriendlyFireYorha",
    "NPC.killPl1000Playable",
    "NPC.setPl1000StandUp",
    "Pl0000.clearLimitAction",
    "Em1050.startEm1050Attack",
    "Pl0000.changePlayerFinal",
    "Pl0000.setYorhaBackFoot",
    "Pl0000.disableFriendlyFireYorha",
    "EmBase.callEnemy",
    "Em7000.stopEm7000Battle",
    "Pl0000.setInputIgnore",
    "Bunker.onEff_Outage",
    "Bunker.onEff_SpaceDebris",
    "Bunker.onLastBunkerFilter",
    "Pl0000.setBunkerEventStart",
    "Pl0000.setHackingLocation",
    "Pl0000.endHackingLocation",
    "EmBase.hapSaveParam",
    "Em1050.startEm1050Fall",
    "event_promotion",
    "EmBase.clearDispHpBar",
    "Pl0000.setPosTowerLift",
    "Ba0630.setStart",
    "BehaviorTowerControl.lookEffect",
    "NPC.setPl1000DieDown",
    "Bg6001.startCountDown",
    "Pl0000.setHackingFilterCore11",
    "Pl0000.setHackingFilterCore14",
    "Bg5032.setEndMovieEff",
    "Pl0000.disableFriendlyFire",
    "Pl0000.enableHackingFriendlyFire",
    "Pl0000.startChangePLNoise",
    "Em1100.setPlBossLaser",
    "MiscState.DISP_OFF",
    "BehaviorDoor.closed",
    "BehaviorDoor.lock",
    "Pl0000.setDownEmp",
    "NPC.setPl1001ComeOut",
    "Pl0000.setWait",
    "BehaviorTowerControl.onWall",
    "BehaviorTowerControl.startLift",
    "Em8000.endLiftBattle",
    "NPC.setRepairPl1000",
    "EmBase.offDefScared",
    "EmBase.clearUndead",
    "EnemyGenerator.setDieRtn",
    "Baa000.setProwl",
    "BehaviorAppBase.requestMove",
    "EmBase.changeNPC",
    "EmBase.setCoverBoar",
    "Baa000.stopAttack",
    "EmBase.endCoverBoar",
    "QuestState.unmount",
    "Baa000.setEscapePos",
    "EmBase.endTraining",
    "Pl0000.endTraining",
    "EmBase.offEffDojoField",
    "EmBase.startTraining",
    "Pl0000.startTraining",
    "EmBase.onEffDojoField",
    "EmBase.startTrainingB",
    "EmBase.endTrainingB",
    "EmBase.onDefScared",
    "HackingEnemy.disableDamage",
    "EmBase.setDefenseMoveRtn",
    "EmBase.setDieRtnNoDrop",
    "Pl0000.endNoDmgSubQuest",
    "Pl0000.startNoDmgSubQuest",
    "FastTravel.travel",
    "EmBase.onNoDieSuperArmor",
    "EmBase.onHackingNoReaction",
    "EmBase.setHackingStageLabelByHap",
    "EmBase.startRace",
    "EmBase.offCheckerEff",
    "Pl0000.onLookFlower",
    "Pl1010.onAppearEff",
    "Pl0000.offLookFlower",
    "Pl1010.onPathMove",
    "QuestBindArea.setDone",
    "Em1050.startEm1050Escape",
    "Ba0014.closeCurtainForce",
    "Ba0014.openCurtain",
    "Ba0014.closeCurtain",
    "EmBase.goRomeoJuliet",
    "EmBase.stopRomeoJuliet",
    "EmBase.startSQParade",
    "EmBase.startSQParade2nd",
    "EmBase.endSQParade",
    "EmBase.setMutekiTimer",
    "NPC.startPl2040Photograph",
    "NPC.endPl2040Photograph",
    "Ba2018.canHack",
    "Em8800.start2ndBattle",
    "Em8800.start3rdBattle",
    "Em8800.startFinalBattle",
    "Pl0000.onEmileBullet",
    "Pl0000.onFlashLight",
    "EmBase.endSleep",
    "EmBase.endNotExplode",
    "Pl0000.offEmileBullet",
    "BehaviorSetItem.pick",
    "HackingEnemy.enableDamage",
    "HackingEnemy.changeMoveType_Stop",
    "disable_vfx",
    "HackingEnemy.setGunEnable",
    "HackingEnemy.changeGunType_OneShot",
    "HackingEnemy.setBulletBlackShot",
    "HackingEnemy.setGunDur",
    "HackingEnemy.setGunInter",
    "HackingEnemy.changeTargetType_Player",
    "HackingEnemy.setGunSpeed",
    "Pl0000.setHackingTopView",
    "Et002e.repairCancel",
    "Et002e.repair",
    "Et002e.complete",
    "Pl0000.setUINoiseFilterLv1",
    "Pl0000.setUINoiseFilterLv2",
    "Pl0000.setUINoiseFilterLv3",
    "Et002c.repair",
    "Et002c.repairCancel",
    "Et002c.complete",
    "Pl0000.setHackingFilterUI",
    "Pl0000.setHackingLightS",
    "Pl0000.setHackingLightM",
    "Pl0000.setHackingLightL",
    "Pl0000.setHackingLightComp",
    "Pl0000.setHackingSound_Access_1",
    "Pl0000.setHackingSound_Access_2",
    "Pl0000.setHackingSound_Access_3",
    "Pl0000.clearUINoiseFilter",
    "Pl0000.setUINoiseFilterLv0",
    "Pl0000.setUINoiseFilterMax",
    "Pl0000.setHackingFilterCore13",
    "HackingEnemy.changeMoveType_Random",
    "MiscState.save",
    "Pl0000.onSleepFade",
    "Pl0000.offSleepFade",
    "ContinueState.setBadEnd",
    "LoopElevatorAction.inEvSWFloor1",
    "LoopElevatorAction.inEvSWFloor0",
    "Ba0202.callUnLockSe",
    "Pl0000.startHackingQuestBugNoise",
    "HackingEnemy.setGunRot",
    "HackingEnemy.changeTargetType_Rolling",
    "HackingEnemy.onEscape",
    "commandLabel",
    "BehaviorDrop.init",
    "Em0110.startParade",
    "Ba0011.setColEnable",
    "Ba0011.setMotStart",
    "MiscState.setOnJetCoaseter",
    "MiscState.setOnJetCorsterIgnore",
    "Ba0011.setMotApeear",
    "EmBase.startSlide",
    "EmBase.setSlideEndPos",
    "EmBase.resetSlide",
    "EmBase.setNpcScare",
    "EmBase.setSurpriseA",
    "EmBase.setSurpriseC",
    "NPC.setBreakPl1100",
    "Bg6000.unrock",
    "NPC.startPl1100Battle",
    "NPC.endPl1100Battle",
    "Pl0000.setPosResetHap",
    "BehaviorDoor.close",
    "Bga010.startTrain",
    "EmBase.onEm001dStopEnable",
    "EmBase.offEm001dStopEnable",
    "Bga010.fadeTrain",
    "EmBase.resetEm001dStopTimer",
    "EmBase.onBreakArmEnable",
    "EmBase.enableLoockCtrlPL",
    "Em0010.setEm001d_Restart",
    "NoiseAction.startNoise",
    "NoiseAction.endNoise",
    "EmBase.onEm001dStopAction",
    "EmBase.setEm0030Spin",
    "Pl0000.setTurnTarget",
    "Em5000.clearEm5000PresidentAtkWait",
    "Em5000.setEm5000NewPresident",
    "ColosseumAction.setDarkBattle"
];

const conditionLabels = [
    "CREATED",
    "DONE",
    "PLAY",
    "WAIT",
    "ACCESS_BAN_BA2016",
    "SceneStateSystem.has",
    "MiscState.getSaveData",
    "QuestState.mounted",
    "DEAD",
    "TICK",
    "TERMINATED",
    "CLEAR",
    "auto_0_talk1_end",
    "EntityLayoutAction.layoutIsDone",
    "OUTSIDE",
    "INSIDE",
    "ACTIVE",
    "p100_16_talk_end",
    "p100_16_start_end",
    "Pl0000.isRoboOilFull",
    "HIT",
    "PLAYING",
    "HACKED",
    "p100_80_start_end",
    "pascal_talk1_end",
    "pascal_talk2_end",
    "ON_NET_DIALOG_END",
    "p100_10_9STalk1_end",
    "p100_10_9STalk2_end",
    "ane_talk1_end",
    "ane_talk2_end",
    "pascal_talk3_end",
    "SCROLLING",
    "LOOP",
    "SCROLLING_READ",
    "LOOP_READ",
    "BATTLE",
    "BehaviorAppBase.getHpRate100",
    "R_FALLED",
    "EnemySetAction.layoutIsDone",
    "STOP",
    "ON_SIGNAL_1ST_HALF",
    "ON_SIGNAL_1ST_HALF_END",
    "ON_SIGNAL_1ST_HALF_2ND",
    "ON_SIGNAL_1ST_END",
    "E3_TRIAL_END",
    "Action.isEnabled",
    "p100_78_doorUnlock",
    "Pl0000.hasBuddy",
    "q100_77_hackingTalk_end",
    "ON_SIGNAL_BRIDGE",
    "ScrollMap.getScrollNo",
    "ON_HACKING_CLEAR",
    "ON_EVENT_SKIP",
    "STOP_MOVE",
    "E3_TRIAL_START",
    "ON_SIGNAL_9S_EVENT_START",
    "FADE_WAIT",
    "FADEOUT",
    "LOADED",
    "ON_SIGNAL_NEXT",
    "TB_WAKEUP_BEGIN",
    "RUN",
    "OMAKE_COMPLETE",
    "R_OPENED",
    "MiscState.canSellArchive",
    "ON_SIGNAL_SHOOTING",
    "ON_FLIGHT_UNIT_GETON",
    "R_DIED",
    "NEXT_BATTLE",
    "ON_BATTLE",
    "battle_start_em0040",
    "ON_SIGNAL_MISSILE",
    "END_BATTLE",
    "p100_79_startTalk_end",
    "ON_CHECK",
    "q100_77_bossStart_end",
    "R_DONE",
    "DEFAULT",
    "R_DOWNED",
    "R_OPENING",
    "p200_15_talk1_end",
    "p200_15_jackasTalk_end",
    "p200_20_toCamp1_end",
    "p200_20_start_end",
    "p200_130_talk1_end",
    "p200_130_start_end",
    "p200_130_talk2_end",
    "p200_130_pascalTalk_end",
    "p200_30_startCaution",
    "p200_30_talk_end",
    "p200_140_start_end",
    "p200_140_shireiTalk_end",
    "STG_BARRIER_OFF",
    "p200_200_vsEve3_end",
    "HITOUT",
    "FINAL_ATTACK",
    "ON_BREAKMODE",
    "BehaviorAppBase.getHp",
    "p200_190_snakeDone_end",
    "EVE_END",
    "p200_80_00_end",
    "p200_170_talk1_end",
    "EM5000_1ST_ESCAPE",
    "ON_FLIGHT_UNIT_START_GETON_2",
    "SKIP",
    "ON_ROUTE_END",
    "EM1030_ESCAOE",
    "ON_BED_SELFHACKING",
    "p200_200_9SDestroy_end",
    "EM5000_TALK_END_DAMAGE",
    "Pl0000.isActiveSkillSonar",
    "FastTravel.transporterIsEnabled",
    "p200_180_pascal_end",
    "p200_140_goToHacking_end",
    "ON_EVE_HACKING_COMPLETE",
    "p200_200_protect9S2_end",
    "BALL_HEALING",
    "p200_200_vsEve2_end",
    "leader_talk_end",
    "ON_SCARE_TALK",
    "TIMEOVER",
    "p200_190_bye_end",
    "p200_160_pascal_end",
    "p200_160_talk2_end",
    "p200_160_rcHelp_end",
    "p200_170_leaderTalk_end",
    "p200_170_leaderMove_end",
    "p200_80_10_end",
    "p300_91_pascalTalk1_end",
    "p300_91_pascalTalk2_end",
    "q910_startTalk_end",
    "q910_pascal_notKill_end",
    "p300_90_aneTalk_end",
    "p300_90_talk3_end",
    "p300_50_caution1_end",
    "p300_25_caution_end",
    "ON_EM2100_COVER_DAMAGE",
    "COUNT",
    "p300_180_emDone_end",
    "EM5000_DIE_NEAR_PL",
    "p300_quake",
    "p300_80_talk_end",
    "p300_26_caution_end",
    "p300_27_caution_end",
    "STG_BATTLE_LIMIT",
    "m3010s0020_talk00_end",
    "m3010s0020_talk01_end",
    "m3010s0020_talk02_end",
    "m3010s0020_talk03_end",
    "Em1100.isEm1100AtkEnd",
    "markOn",
    "p300_20_start_end",
    "p300_20_talk2_end",
    "p300_31_shireiBye_end",
    "ON_BUNKER_EVENT_END",
    "REQUESTED",
    "p300_91_aneTalk_end",
    "m3010s0010_talk00_end",
    "EVENT_KILL",
    "TB_HACKING_SUCCEED",
    "DELAY",
    "p300_82_talk4_end",
    "setBlackout",
    "p300_50_virus6_end",
    "MiscState.var",
    "ON_DIE",
    "BadEndEnable",
    "endUpload",
    "ON_EM7000_DIE",
    "p300_82_btlStart_end",
    "p300_82_talk2_end",
    "START_FLOAT",
    "p300_26_talk2_end",
    "p300_25_talk5_end",
    "p300_30_shireiTalk_end",
    "EM1074_RECOVERY",
    "EM1074_VIRUS",
    "p300_180_unit1_end",
    "HP_80",
    "kumo_talk2_end",
    "p300_30_doorLock_end",
    "p300_31_doorUnLock_end",
    "p300_31_talk1_end",
    "p300_31_talk2_end",
    "p300_31_talk3_end",
    "HP_60",
    "HP_40",
    "HP_20",
    "p300_180_doorLocked_end",
    "p300_180_unit3_end",
    "ON_HACKING_RATE_60_OVER",
    "p300_180_unit4_end",
    "p300_30_btl2Start",
    "p300_30_btl3Start",
    "kumo_talk4_end",
    "FRONT_CHANGE_ENABLE",
    "BACK_CHANGE_ENABLE",
    "RIGHT_CHANGE_ENABLE",
    "LEFT_CHANGE_ENABLE",
    "p300_180_unit5_end",
    "kumo_talk3_end",
    "p300_300_talk2_end",
    "TOWER_NOTHACKING_30",
    "TOWER_NOTHACKING_60",
    "TOWER_NOTHACKING_120",
    "TOWER_NOTHACKING_180",
    "p300_26_talk3_end",
    "p300_20_caution1_end",
    "p300_10_caution1_end",
    "p300_26_talk1_end",
    "kumo_talk1_end",
    "p300_20_sos1_CLR_end",
    "p300_20_sos2_CLR_end",
    "p300_20_sos3_CLR_end",
    "p300_20_FAIL_end",
    "q031_talk1_end",
    "q032_talk1_end",
    "ARRIVED_POINT",
    "q104_btl2_end_talkEnd",
    "q104_DONE_talk_end",
    "TARGET_FAR",
    "TARGET_LONG_FAR",
    "Behavior.isTrans",
    "q123_talk2_end",
    "ACCESS_BAN_BA1600",
    "q140_talk2_end",
    "q150_EM_start",
    "FAILURE",
    "ON_NO_DMG_SQ_FAIL",
    "FastTravel.transporterIsReadyToUnlock",
    "q221_talk3_end",
    "q221_talk4_end",
    "START_HACKING",
    "ICON_VISIBLE",
    "ON_TALK",
    "RACE_DAMAGE",
    "DOWN",
    "UP",
    "AREA_WAIT",
    "DIE_DOWN",
    "q500_talk3_end",
    "q500_talk5_end",
    "q720_talk12_end",
    "q770_talk1_end",
    "q770_talk2_end",
    "MiscState.isAllMaxLvWp",
    "q900_emilTalk_end",
    "q900_talk3_end",
    "q900_talk4_end",
    "q900_talk5_end",
    "FINAL_BOMB",
    "STOP_BOMB",
    "q900_talk6_end",
    "q910_selePascalKill",
    "CANCEL",
    "PRESS",
    "LAYOUT_DONE",
    "ON_SUICIDE_BOBM",
    "q290_bugFind1_end",
    "q290_bugFind2_end",
    "q290_bugFind3_end",
    "ACCESS_BAN_BA1610",
    "ESCAPE_BATTLE",
    "pascal_bgm",
    "ON_HACKING_FAILD_MT_HL",
    "TOWERHACK_1",
    "ON_HACKING_FAILD_ST_HL",
    "R_HACKED",
    "R_OFF_CANT_HACKING",
    "ON_MT_HACKING",
    "START_PL1100_BATTLE",
    "END_PL1100_BATTLE",
    "START_TOWERHACK",
    "START_EXTRA_N2",
    "START_BATTLE_EVENTS",
    "START_FINAL_BATTLE",
    "START_FINAL_MUSIC",
    "START_FINAL_CUTSCENE",
    "START_SPAWN_EVENT",
    "START_POLLUTION",
    "START_POLLUTION_S",
    "START_REMOVEBGM",
    "START_ROOM_WAKE",
    "MiscState.getQuestClearRate",
    "q095_startTalk_end",
    "RESTART_FADEOUT",
    "RESTART_FADE_END",
    "q095_endTalk_end",
    "MiscState.STA_CK",
    "ColosseumAction.isInTheBattleGround",
    "BATTLE_IN",
    "UITimerAction.getMsec"
];
