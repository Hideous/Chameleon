include("shared.lua")

SWEP.PrintName = "Propifier"
SWEP.Slot = 1
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true

function SWEP:PrimaryAttack()
end

function SWEP:SecondaryAttack()
end

function SWEP:Initialize()
	self.HUDEntity = nil
	self.HUDLights = {}
	self.HUDLights[BOX_TOP] = Color(255, 255, 255)
	self.HUDLights[BOX_FRONT] = Color(255, 255, 255)
	self.HUDCamPos = Vector(50, 50, 50)
	self.HUDLookAt = Vector(0, 0, 40)
	self.HUDFOV = 70
	
	local TestText = vgui.Create("DHudElement")
	TestText:SizeToContents()
	TestText:SetText("testing")
	GAMEMODE:AddHUDItem(TestText, 3)
end

function SWEP:SetHUDModel(ModelName)
	if (IsValid(self.HUDEntity)) then
		self.HUDEntity:Remove()
		self.HUDEntity = nil
	end
	
	if (!ClientsideModel) then
		return
	end
	
	self.HUDEntity = ClientsideModel(ModelName, RENDER_GROUP_OPAQUE_ENTITY)
	if (!IsValid(self.HUDEntity)) then
		return
	end
	
	self.HUDEntity:SetNoDraw(true)
	
	
	//stolen from DModelPanel.lua. Thanks Garry.
	local iSeq = self.Entity:LookupSequence("walk_all")
	if (iSeq <= 0) then
		iSeq = self.Entity:LookupSequence("WalkUnarmed_all")
	end
	if (iSeq <= 0) then
		iSeq = self.Entity:LookupSequence( "walk_all_moderate" )
	end
	
	if (iSeq > 0) then
		self.Entity:ResetSequence( iSeq )
	end
end

function SWEP:Think()
	local Trace = self.Owner:GetEyeTrace()
	if (Trace.HitWorld) then
		self.CurrentModel = nil
		return
	end
	if (!Trace.Entity:IsValid()) then
		self.CurrentModel = nil
		return
	end
	
	local HitEntity = Trace.Entity
	
	local Distance = HitEntity:GetPos():Distance(self.Owner:GetPos())
	
	if (Distance < 100) then
		self.CurrentModel = nil
		return
	end
	
	self.CurrentModel = HitEntity:GetModel()
end

function SWEP:DrawHUD()
	if (!IsValid(self.HUDEntity)) then
		return
	end
	
	
end