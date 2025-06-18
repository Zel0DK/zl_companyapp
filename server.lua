function CountPlayersWithJob(job)
    local playerCount = 0
    local xPlayers = ESX.GetExtendedPlayers('job', job)
    for _, xPlayer in pairs(xPlayers) do
        playerCount = playerCount + 1
    end

    return playerCount
end

lib.callback.register('zl_companyapp:getCompanies', function(status)
    local results = {}

    for _, company in ipairs(Config.Companies) do
        local jobStatus = CountPlayersWithJob(company.job) > 0
        table.insert(results, {
            img = company.img,
            label = company.label,
            showStatus = company.showStatus,
            status = jobStatus,
            job = company.job,
        })
    end

    return results
end)

RegisterNetEvent("zl_companyapp:sendCompanyMessage", function(message, job, coords)
    exports['visualz_opkaldsliste']:AddCall(source, message, job)
end)