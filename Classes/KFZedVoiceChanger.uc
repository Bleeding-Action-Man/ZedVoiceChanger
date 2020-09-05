//=============================================================================
// Base Mutator by Marco
// Edited for custom sounds by Vel-San
// for more information, feedback, questions or requests please contact
// https://steamcommunity.com/id/Vel-San/
//=============================================================================

Class KFZedVoiceChanger extends Mutator config(KFZedVoiceChanger);

#exec OBJ LOAD FILE=KF_VP.uax

var() config bool bSiren, bScrake, bFleshP, bPatty, bBloat, bClot, bCrawler, bGib, bDecap, bDEBUG;
var bool Siren, Scrake, FleshP, Patty, Bloat, Clot, Crawler, Gib, Decap, DEBUG;

replication
{
	unreliable if (Role == ROLE_Authority)
		bSiren, bScrake, bFleshP, bPatty, bBloat, bClot, bCrawler, bGib, bDecap, bDEBUG,
		Siren, Scrake, FleshP, Patty, Bloat, Clot, Crawler, Gib, Decap, DEBUG;
}

function PreBeginPlay()
{
	AddToPackageMap();
	AddToPackageMap(Class'KFVP'.Static.GetVoicePackage());
}

simulated function PostBeginPlay()
{
	Siren = bSiren;
	Scrake = bScrake;
	FleshP = bFleshP;
	Patty = bPatty;
	Bloat = bBloat;
	Clot = bClot;
	Crawler = bCrawler;
	Gib = bGib;
	Decap = bDecap;
	DEBUG = bDEBUG;
	SetTimer(0.1,False);
}

simulated function PostNetBeginPlay()
{
	// Future code goes here if values needed from the server
	TimeStampLog("-----|| Server Vars Replicated ||-----");
	if(DEBUG){
		MutLog("-----|| DEBUG - Siren: " $Siren$ " ||-----");
		MutLog("-----|| DEBUG - Scrake: " $Scrake$ " ||-----");
		MutLog("-----|| DEBUG - FleshP: " $FleshP$ " ||-----");
		MutLog("-----|| DEBUG - Patty: " $Patty$ " ||-----");
		MutLog("-----|| DEBUG - Bloat: " $Bloat$ " ||-----");
		MutLog("-----|| DEBUG - Clot: " $Clot$ " ||-----");
		MutLog("-----|| DEBUG - Crawler: " $Crawler$ " ||-----");
		MutLog("-----|| DEBUG - Gib: " $Gib$ " ||-----");
		MutLog("-----|| DEBUG - Decap: " $Decap$ " ||-----");
	}

	class'KFVP'.default.bSiren = Siren;
    class'KFVP'.default.bScrake = Scrake;
    class'KFVP'.default.bFleshP = FleshP;
    class'KFVP'.default.bPatty = Patty;
    class'KFVP'.default.bBloat = Bloat;
    class'KFVP'.default.bClot = Clot;
	class'KFVP'.default.bCrawler = Crawler;
	class'KFVP'.default.bGib = Gib;
	class'KFVP'.default.bDecap = Decap;
}

simulated function Tick( float Delta )
{
	// Forces client to download the VoicePack
	if( Level.NetMode!=NM_DedicatedServer){
		Class'KFVP'.Static.InitializeSoundsFor(Level.GetLocalPlayerController());
	}

	Disable('Tick');
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
	Super.FillPlayInfo(PlayInfo);
    PlayInfo.AddSetting("KFZedVoiceChanger", "bSiren", "Siren", 0, 0, "check");
    PlayInfo.AddSetting("KFZedVoiceChanger", "bScrake", "Scrake", 0, 0, "check");
    PlayInfo.AddSetting("KFZedVoiceChanger", "bFleshP", "FleshPound", 0, 0, "check");
    PlayInfo.AddSetting("KFZedVoiceChanger", "bPatty", "Patty Daddy", 0, 0, "check");
    PlayInfo.AddSetting("KFZedVoiceChanger", "bBloat", "Bloat", 0, 0, "check");
    PlayInfo.AddSetting("KFZedVoiceChanger", "bClot", "Clot", 0, 0, "check");
    PlayInfo.AddSetting("KFZedVoiceChanger", "bCrawler", "Crawler", 0, 0, "check");
    PlayInfo.AddSetting("KFZedVoiceChanger", "bGib", "Gib", 0, 0, "check");
    PlayInfo.AddSetting("KFZedVoiceChanger", "bDecap", "Decap", 0, 0, "check");
    PlayInfo.AddSetting("KFZedVoiceChanger", "bDEBUG", "DEBUG", 0, 0, "check");

}

static function string GetDescriptionText(string SettingName)
{
	switch(SettingName)
	{
		case "bSiren":
			return "Replaces Siren scream with a Demon Screech";
        case "bScrake":
			return "Replaces Scrake sound with Blood Axe Chaac from SMITE";
        case "bFleshP":
			return "Replaces Fleshpound rage with Godzilla Scream";
		case "bPatty":
			return "Memes. Just MEMES.";
		case "bBloat":
			return "L4D2 Boomer Explosion & Idle Talking";
        case "bClot":
			return "Changes headshot death sounds with 'Roblox OOF'";
		case "bCrawler":
			return "Changes Crawler Death sound to a bug-squish";
		case "bGib":
			return "Removes ZED Death sound after being killed by a headshot, works best with 'Decap' Enabled!";
		case "bDecap":
			return "POP Sound for Headshots! POP POP POP!";
		case "bDEBUG":
			return "Shows some Debugging messages in the LOG. Better to keep off!";
		default:
			return Super.GetDescriptionText(SettingName);
	}
}

simulated function TimeStampLog(coerce string s)
{
    log("["$Level.TimeSeconds$"s]" @ s, 'ZedVoiceChanger');
}

simulated function MutLog(string s)
{
    log(s, 'ZedVoiceChanger');
}

function Timer(){
	ApplyMonsterCollection();
}

simulated function ApplyMonsterCollection(){
	local KFGameType KF;
	KF = KFGameType(Level.Game);

	MutLog("-----|| Changing Monster Collection ||-----");

	KF.MonsterCollection = class'KFMonstersCustomCollection';
    KF.SpecialEventMonsterCollections[0] = class'KFMonstersCustomCollection';

    KF.PrepareSpecialSquads();
    KF.LoadUpMonsterList();

	if(DEBUG){
	MutLog("-----|| DEBUG - Monster Collection: " $KF.MonsterCollection$ " ||-----");
	MutLog("-----|| DEBUG - SpecialEventMonsterCollections: " $KF.SpecialEventMonsterCollections[0]$ " ||-----");
	}
}

defaultproperties
{
	// Mut Vars
    GroupName="KF-ZedVoiceChanger"
    FriendlyName="ZED Voice Changer Mut - v3.2"
    Description="Apply Custom sounds for some ZEDs & Mixes up ZED Skins; By Vel-San & Marco"
    bAlwaysRelevant=True
    RemoteRole=ROLE_SimulatedProxy
	bNetNotify=True
}
