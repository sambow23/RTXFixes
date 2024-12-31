ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "HDRI Cube"
ENT.Author = "Your Name"
ENT.Spawnable = true
ENT.AdminOnly = false
ENT.Category = "HDRI Tools"

function ENT:SetupDataTables()
    self:NetworkVar("String", 0, "TexturePath")
end