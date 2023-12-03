Config = {
    webhookURL = '',
    prefix = '^5[^1911^5] ^3';
    roleList = { -- replace the 1 with the role id
        ['SAHP'] = 1,
        ['BCSO'] = 1,
        ['BCPD'] = 1,
        ['CO'] = 1,
        ['Fire & EMS'] = 1,
    },

    
    --------------
    -- ACE PERM --
    --------------

    respAce = "BADGER-911.Respond",

    --------------
    -- COMMANDS --
    --------------

    emergencyCommand = "911", -- the 911 Command
    respondCommand = "resp" -- the respond command
}
