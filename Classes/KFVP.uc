Class KFVP extends Interaction;

const VoicePackageName="KF_VP";

struct FSoundCacheType
{
	var SoundGroup S;
	var array<Sound> L;
};
var array<FSoundCacheType> Cache;

function Initialized()
{
	local SoundGroup S;

	// FleshPound
	CacheSound(S,SoundGroup'KF_EnemiesFinalSnd.FP_Rage');
	S.Sounds.Length = 1;
	S.Sounds[0] = LoadSound("Godzilla_Rage");
}

function NotifyLevelChange()
{
	local int i;

	// Cleanup this mod and reset voices.
	for( i=0; i<Cache.Length; ++i )
		Cache[i].S.Sounds = Cache[i].L;
	Cache.Length = 0;

}

final function CacheSound( out SoundGroup S, SoundGroup In )
{
	local int i;
	
	S = In;
	i = Cache.Length;
	Cache.Length = i+1;
	Cache[i].S = S;
	Cache[i].L = S.Sounds;
}
final function CacheCopySound( SoundGroup S, SoundGroup Src )
{
	CacheSound(S,S);
	S.Sounds = Src.Sounds;
}
static final function InitializeSoundsFor( PlayerController PC )
{
	local int i;
	local KFVP C;

	if( PC==None )
		return;
	for( i=(PC.Player.LocalInteractions.Length-1); i>=0; --i )
		if( PC.Player.LocalInteractions[i].Class==Default.Class )
			return;
	C = new(None) Class'KFVP';
	C.ViewportOwner = PC.Player;
	C.Master = PC.Player.InteractionMaster;
	i = PC.Player.LocalInteractions.Length;
	PC.Player.LocalInteractions.Length = i+1;
	PC.Player.LocalInteractions[i] = C;
	C.Initialize();
}

static final function string GetVoicePackage()
{
	return VoicePackageName;
}
static final function Sound LoadSound( string N )
{
	return Sound(DynamicLoadObject(VoicePackageName$"."$N,Class'Sound'));
}

defaultproperties
{
}