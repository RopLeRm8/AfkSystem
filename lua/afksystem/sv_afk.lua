ListOfAfk = {}
hook.Add("PlayerSpawn", "SetAFK", function(p)

    p.afk = true
    p.time = CurTime()
    ListOfAfk[p] = true

end)

hook.Add("PlayerButtonDown", "StopAFK", function(ply)

    ply.afk = false
    ply.time = CurTime()
    table.RemoveByValue(ListOfAfk, ListOfAfk[ply])

end)

timer.Create("TimerForChecks", 1, 0, function()
    for k, v in ipairs(player.GetAll()) do

        if CurTime() > v.time + 10 then
            v.time = CurTime()
            v.afk = true
            if not ListOfAfk[v] then ListOfAfk[v] = true end

        end
    end

end)

