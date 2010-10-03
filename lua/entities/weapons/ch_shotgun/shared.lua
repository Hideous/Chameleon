SWEP.PrintName 		= "Shotgun"
 
SWEP.Author 		= "Hideous"
SWEP.Instructions 	= "Point and fire."
SWEP.Contact 		= "admin@hideou.se"
SWEP.Purpose 		= "More long-range, less wide spread (don't want to be able to spray over a room and find all hidden props)"
 
SWEP.AdminSpawnable = false
SWEP.Spawnable 		= false
 
SWEP.ViewModelFOV 	= 64
SWEP.ViewModel 		= "models/weapons/v_shot_xm101.mdl" //CS:S Shotgun.
SWEP.WorldModel 	= "models/weapons/w_shot_xm101.mdl"
 
SWEP.AutoSwitchTo 	= false
SWEP.AutoSwitchFrom = true
 
SWEP.Slot 			= 3 //Order slots by heaviness. Melee in 1, nukes in 5. Or similar.
SWEP.SlotPos 		= 1
 
SWEP.HoldType 		= "shotgun"
 
SWEP.FiresUnderwater = false
 
SWEP.Weight = 5 //Weight for weapon switching. Irrelevant in this case.
 
SWEP.DrawCrosshair = true
 
SWEP.Category = "Chameleon" //Might as well set a category. 
 
SWEP.DrawAmmo = true // Does the ammo show up when you are using it ? True / False 
 
//SWEP.ReloadSound = "sound/owningyou.wav" // Owning you? What?
 
SWEP.base = "weapon_base" //All weapons are based on this.
 
 
SWEP.Primary.Sound = "sound/weapons/shotgun/shotgun_fire7.wav"
SWEP.Primary.Pitch = 200
SWEP.Primary.Damage = 6 // How much damage the swep is doing 
SWEP.Primary.TakeAmmo = 1 // How much ammo does it take for each shot ? 
SWEP.Primary.ClipSize = 6 // The clipsize 
SWEP.Primary.Ammo = "Buckshot" // ammmo type pistol/ smg1 
SWEP.Primary.DefaultClip = 30
SWEP.Primary.Spread = Vector(3, 3, 3) //0.1 seems good for complete accuracy.
SWEP.Primary.NumberofShots = 3 // How many bullets are fired with each shot? 
SWEP.Primary.Automatic = false
SWEP.Primary.Recoil = 15
SWEP.Primary.Delay = 1.5 
SWEP.Primary.Force = 130 // The force of the shot 
//PrimaryFire settings\\
 
//Secondary Fire is irrelevant here, no such thing on the shotgun
//Variables are... strange because of the template used. Most of this is unused.
SWEP.Secondary.NumberofShots = 1
SWEP.Secondary.Force = 1000
SWEP.Secondary.Spread = 0.1 
SWEP.Secondary.Sound = "sound/ultrakill.wav"
SWEP.Secondary.DefaultClip = 100
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "Pistol"
SWEP.Secondary.Recoil = 10
SWEP.Secondary.Delay = 3
SWEP.Secondary.TakeAmmo = 1 // How much ammo Does it take ? 
SWEP.Secondary.ClipSize = 100 // ClipSize 
SWEP.Secondary.Damage = 1000 // The damage the explosion does. 
SWEP.Secondary.Magnitude = "175" // How big its the explosion ? 
//Secondary Fire Variables\\
 
//SWEP:Initialize\\ 
function SWEP:Initialize() 
	util.PrecacheSound(self.Primary.Sound) 
	//util.PrecacheSound(self.Secondary.Sound) 
    self:SetWeaponHoldType( self.HoldType )
end 

function SWEP:PrimaryAttack() 
	if ( !self:CanPrimaryAttack() ) then return end 
 
	self.Owner:LagCompensation(true) //Enable lag compensation for a 'lil bit
 
	local bullet = {} 
		bullet.Num = self.Primary.NumberofShots 
		bullet.Src = self.Owner:GetShootPos() 
		bullet.Dir = self.Owner:GetAimVector() 
		bullet.Spread = Vector( self.Primary.Spread * 0.1 , self.Primary.Spread * 0.1, 0) 
		bullet.Tracer = 0 
		bullet.Force = self.Primary.Force 
		bullet.Damage = self.Primary.Damage 
		bullet.AmmoType = self.Primary.Ammo 
 
	self.Owner:FireBullets( bullet ) 
	self.Owner:LagCompensation(false) //Bullet has been fired, disable lag compensation
	
	local rnda = self.Primary.Recoil * -1 
	local rndb = self.Primary.Recoil * math.random(-1, 1) 
 
	self:ShootEffects() 
	
	self:EmitSound(self.Primary.Sound, 100, self.Primary.Pitch) 
	self.Owner:ViewPunch( Angle( rnda,rndb,rnda ) ) 
	self:TakePrimaryAmmo(self.Primary.TakeAmmo)
	self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
end 

function SWEP:SecondaryAttack() 
	//If the weapon had a secondary attack, we'd do that here
end 