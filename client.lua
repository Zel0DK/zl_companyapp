Citizen.CreateThread(function()
    local added, errorMessage = exports["lb-phone"]:AddCustomApp({
        identifier = "zl_companyapp",
        developer = "Zel0",
        name = Config.AppInfo.name,
        description = Config.AppInfo.description,
        defaultApp = Config.AppInfo.defaultApp,
        size = Config.AppInfo.size,
        price = Config.AppInfo.price,
        ui = GetCurrentResourceName() .. "/ui/dist/index.html",
        icon = "https://cfx-nui-" .. GetCurrentResourceName() .. "/ui/dist/icon.png",
        fixBlur = true
    })

    if not added then
        print("Fejl, opret en dev ticket - [zl-companyapp]")
    end
end)

RegisterNUICallback("setupApp", function(data, cb)
    local companies = lib.callback.await('zl_companyapp:getCompanies', false)
    cb(companies)
end)

RegisterNUICallback("sendMessage", function(data, cb)
    local coords = GetEntityCoords(cache.ped)
    TriggerServerEvent("zl_companyapp:sendCompanyMessage", data.message, data.job.job, coords)
    cb('ok')
end)