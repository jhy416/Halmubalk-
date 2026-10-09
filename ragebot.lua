env._riv_startRagebot = function(on)
        if _rageConn then _rageConn:Disconnect(); _rageConn = nil end
        fovCircle.Visible = false; _rageShooting = false
        env._silentRageActive = on and (Toggles.SilentAim and Toggles.SilentAim.Value or false)
        _startPTP(on)
        if not on then
            _tcRemoveConsumer()
            return
        end
        _tcAddConsumer()
        local vp = Camera.ViewportSize
        fovCircle.Position = Vector2.new(vp.X/2, vp.Y/2)
        fovCircle.Radius   = Options.RageFOV and Options.RageFOV.Value or 250
        fovCircle.Visible  = true
        local _cachedObjId = nil
        _rageConn = RunService.Heartbeat:Connect(function()
            env._silentRageActive = Toggles.SilentAim and Toggles.SilentAim.Value or false
            local myHRP = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
            if not myHRP then return end
            local objId = _getEquippedObjId()
            if objId then _cachedObjId = objId else objId = _cachedObjId end
            if not objId then return end
            local shootPos = myHRP.Position
            for _, p in ipairs(Players:GetPlayers()) do
                if p == LP or not _tcIsEnemy(p) then continue end
                local char = p.Character; if not char then continue end
                local hum = char:FindFirstChildWhichIsA("Humanoid")
                if not hum or hum.Health <= 0 then continue end
                local targetHead = char:FindFirstChild("Head"); if not targetHead then continue end
                local wbOrigin = targetHead.Position - Vector3.new(0, 5, 0)
                local shotData = _buildShotData(wbOrigin, targetHead)
                pcall(function() _useItemRemote:FireServer(objId, _ssEnum, shotData, nil) end)
            end
        end)
end
