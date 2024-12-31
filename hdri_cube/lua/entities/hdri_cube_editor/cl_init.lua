include("shared.lua")

function ENT:Draw()
    self:DrawModel()
end

-- Create the editor panel
local function CreateEditorPanel(ent)
    if IsValid(HDRI_EditorPanel) then
        HDRI_EditorPanel:Remove()
    end

    local frame = vgui.Create("DFrame")
    HDRI_EditorPanel = frame
    frame:SetSize(300, 400)
    frame:SetTitle("HDRI Cube Editor")
    frame:Center()
    frame:MakePopup()

    local textureButton = vgui.Create("DButton", frame)
    textureButton:Dock(TOP)
    textureButton:SetText("Select Texture")
    textureButton:DockMargin(5, 5, 5, 5)
    textureButton:SetTall(30)
    textureButton.DoClick = function()
        -- Add file selection functionality here
    end
end

-- Network receiver for opening the editor
net.Receive("HDRICube_OpenEditor", function()
    local ent = net.ReadEntity()
    if IsValid(ent) then
        CreateEditorPanel(ent)
    end
end)