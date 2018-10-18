local math = require('math')
local player = require('player')
local resources = require('resources')
local string = require('string')
local ui = require('ui')
local windower = require('windower')

local config_state = {
    title = 'Exp Bar',
    style = 'chromeless',
    x = math.floor(windower.settings.ui_size.width / 2) - 350,
    y = 1,
    width = 600,
    height = 16,
    color = ui.color.rgb(0,0,0,0)
}

ui.display(function()
    ui.window('expbar_window', config_state, function()
        ui.location(0,0)
        ui.text(string.format('[%s%d/%s%d]{bold color: %s stroke: %s}',
            resources.jobs[player.main_job_id].ens, player.main_job_level,
            resources.jobs[player.sub_job_id].ens, player.sub_job_level,
            'khaki', '1px black'))

        local xp_percent = player.exp / player.exp_required
        ui.location(100, 5)
        ui.size(500, 2)
        ui.progress(xp_percent, {color = ui.color.khaki})
    end)
end)
