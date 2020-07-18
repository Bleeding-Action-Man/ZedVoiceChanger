//=============================================================================
// Base Mutator by Marco
// Edited for custom sounds by Vel-San
// for more information, feedback, questions or requests please contact
// https://steamcommunity.com/id/Vel-San/
//=============================================================================

Class KFZedVoiceChanger extends Mutator config(KFZedVoiceChanger);

#exec OBJ LOAD FILE=KF_VP.uax

var config bool bSiren, bScrake, bFleshP, bPatty, bBloat, bClot, bCrawler, bGib, bDecap;

replication
{
	unreliable if (Role == ROLE_Authority)
		bScrake, bFleshP, bPatty, bBloat, bClot, bCrawler, bGib, bDecap;
}

function PreBeginPlay()
{
	AddToPackageMap();
	AddToPackageMap(Class'KFVP'.Static.GetVoicePackage());
}

simulated function PostNetBeginPlay()
{
    super.PostNetBeginPlay();
	// Future code goes here if values needed from the server
}

simulated function PostNetReceive()
{
    super.PostNetReceive();
    TimeStampLog("-----|| Server Vars Replicated ||-----");
	// default.bSiren = bSiren;
    default.bScrake = bScrake;
    default.bFleshP = bFleshP;
    default.bPatty = bPatty;
    default.bBloat = bBloat;
    default.bClot = bClot;
	default.bCrawler = bCrawler;
	default.bGib = bGib;
	default.bDecap = bDecap;
}

simulated function Tick( float Delta )
{
	// Make sure client did download the voice pack too.
	if( Level.NetMode!=NM_DedicatedServer){
		Class'KFVP'.Static.InitializeSoundsFor(Level.GetLocalPlayerController());
	}
    
	Disable('Tick');
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
	Super.FillPlayInfo(PlayInfo);
    // PlayInfo.AddSetting("KFZedVoiceChanger", "bSiren", "Siren", 0, 0, "check");
    PlayInfo.AddSetting("KFZedVoiceChanger", "bScrake", "Scrake", 0, 0, "check");
    PlayInfo.AddSetting("KFZedVoiceChanger", "bFleshP", "FleshPound", 0, 0, "check");
    PlayInfo.AddSetting("KFZedVoiceChanger", "bPatty", "Patty Daddy", 0, 0, "check");
    PlayInfo.AddSetting("KFZedVoiceChanger", "bBloat", "Bloat", 0, 0, "check");
    PlayInfo.AddSetting("KFZedVoiceChanger", "bClot", "Clot", 0, 0, "check");
    PlayInfo.AddSetting("KFZedVoiceChanger", "bCrawler", "Crawler", 0, 0, "check");
    PlayInfo.AddSetting("KFZedVoiceChanger", "bGib", "Gib", 0, 0, "check");
    PlayInfo.AddSetting("KFZedVoiceChanger", "bDecap", "Decap", 0, 0, "check");
}

static function string GetDescriptionText(string SettingName)
{
	switch(SettingName)
	{
		// case "bSiren":
		//	return "Replaces Siren scream with a Demon Screech";
        case "bScrake":
			return "Replaces Scrake attacks with Killing Floor 2 Scrakes Voices";
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

defaultproperties
{
	// Mut Vars
    GroupName="KF-ZedVoiceChanger"
    FriendlyName="ZED Voice Changer Mut - v2.0"
    Description="Changes some voice-lines sounds for some ZEDs - More sounds added regularly!"
    bAlwaysRelevant=True
    RemoteRole=ROLE_SimulatedProxy
	bNetNotify=True

	// Bool Vars
	// bSiren=True
	bScrake=True
	bFleshP=True
	bPatty=True
	bBloat=True
    bClot=True
	bCrawler=True
	bGib=True
	bDecap=True
}
