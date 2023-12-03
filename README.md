# Badger-911

## What is it?

Badger-911-Enhanced is a simple, but efficient 911 script for your server. 911 calls are only displayed to those who have a police discord role on your discord server. When someone calls in 911, the call will only be relayed to the cops on the server. There is also a webhook in which you can set up to print the 911 transmissions in as well. What makes this 911 script stand out though is responding to calls. Instead of needing someone to give a postal in the 911 transmission or need them to say where, you can get their exact location the call was made from. Using the command `/resp <response code>` will set your waypoint on the map to the location the call was made at! Now, that's pretty cool.

## Dependency

https://forum.cfx.re/t/discord-roles-for-permissions-im-creative-i-know/233805


## Commands

`/911 <info>` - Call 911 for a situation 

`/resp <response code>` - Respond to the 911 call with this response code

## Configuration

**Found in the config.lua file:**

```
--- CONFIG ---
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
    respAce = "BADGER-911.Respond",

    --------------
    -- COMMANDS --
    --------------
    
    nineoneoneCommand = "911", -- the 911 Command
    respondCommand = "resp" -- the respond command
}
```

Replace the 1s with the role IDs of your corresponding discord roles... (You should all know the drill by now)

## Download

https://github.com/JaredScar/Badger-911/
