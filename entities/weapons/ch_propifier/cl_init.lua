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
	self.ModelPanel = vgui.Create("DModelPanel")
	self.ModelPanel:SetFOV(70)
	self.ModelPanel:SetSize(ScrW() / 4, ScrW() / 4)
	self.ModelPanel:SetModel("")
	GAMEMODE:AddHUDItem(self.ModelPanel, 3)
end


function SWEP:Think()
	local Trace = self.Owner:GetEyeTrace()
	if (Trace.HitWorld) then
		self.ModelPanel:SetModel("")
		return
	end
	if (!Trace.Entity:IsValid()) then
		self.ModelPanel:SetModel("")
		return
	end
	
	local HitEntity = Trace.Entity
	
	local Distance = HitEntity:GetPos():Distance(self.Owner:GetPos())
	
	if (Distance > 100) then
		self.ModelPanel:SetModel("")
		return
	end
	
	local ModelPath = HitEntity:GetModel()
	
	local Min, Max = HitEntity:WorldSpaceAABB()
	local Size = Max - Min
	local Height = Size.z
	
	local MaxWidth = math.Max(Size.x, Size.y)
	local MaxSize = math.Max(MaxWidth, Height)
	
	//do some trig to make camera capture all of the object at FOV = 70 degrees then add 40%
	local RenderDistance = 1.4 * ((MaxSize / (2 * math.tan(math.rad(35)))) + MaxWidth / 2)
	self.ModelPanel:SetCamPos(Vector(0, RenderDistance, Height / 2))
	self.ModelPanel:SetLookAt(Vector(0, 0, Height / 2))
	
	self.ModelPanel:SetModel(ModelPath)
end
