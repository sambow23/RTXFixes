AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/hunter/blocks/cube025x025x025.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    
    local phys = self:GetPhysicsObject()
    if IsValid(phys) then
        phys:Wake()
    end
    
    -- Set default texture path
    self:SetTexturePath("hdri_cube/default_texture")
end

function ENT:Use(activator, caller)
    if IsValid(activator) and activator:IsPlayer() then
        net.Start("HDRICube_OpenEditor")
        net.WriteEntity(self)
        net.Send(activator)
    end
end