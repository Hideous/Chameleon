local CLASS = {}
 
CLASS.DisplayName			= "Chameleon"
CLASS.WalkSpeed 			= 300 //Do any of these matter? We're just going to have them push props anyway.
CLASS.CrouchedWalkSpeed 	= 0.2
CLASS.RunSpeed				= 300
CLASS.DuckSpeed				= 0.2
CLASS.JumpPower				= 200
CLASS.PlayerModel			= "models/player/combine_super_soldier.mdl" //Also irrelevant.
CLASS.DrawTeamRing			= true
CLASS.DrawViewModel			= true
CLASS.CanUseFlashlight      = false
CLASS.MaxHealth				= 75
CLASS.StartHealth			= 75
CLASS.StartArmor			= 0
CLASS.RespawnTime           = 0 // 0 means use the default spawn time chosen by gamemode
CLASS.DropWeaponOnDie		= false
CLASS.TeammateNoCollide 	= true
CLASS.AvoidPlayers			= true // Automatically avoid players that we're no colliding
CLASS.Selectable			= true // When false, this disables all the team checking
CLASS.FullRotation			= true // Allow the player's model to rotate upwards, etc etc
 
//Serge, you'll have to handle this for now. I have no idea how the prop pushing would work. 

function CLASS:Loadout( pl )
end
 
function CLASS:OnSpawn( pl )
end
 
function CLASS:OnDeath( pl, attacker, dmginfo )
end
 
function CLASS:Think( pl )
end
 
function CLASS:Move( pl, mv )
end
 
function CLASS:OnKeyPress( pl, key )
end
 
function CLASS:OnKeyRelease( pl, key )
end
 
function CLASS:ShouldDrawLocalPlayer( pl )
	return false
end
 
function CLASS:CalcView( ply, origin, angles, fov )
end
 
player_class.Register( "Human", CLASS )