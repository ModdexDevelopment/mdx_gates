# MDX Gates

A FiveM resource for spawning and animating interactive gates at police stations, fire stations, and other locations.

## Features

- **Distance-based streaming** - Gates spawn/despawn based on player proximity for better performance
- **Synced animations** - Gate animations sync across all players
- **Automatic respawning** - Gates automatically respawn if deleted by the game
- **Easy configuration** - Simple config file to add new gates
- **ox_lib integration** - Uses ox_lib for notifications (with fallback)

## Dependencies

- [ox_lib](https://github.com/overextended/ox_lib)

## Installation

1. Download and extract to your resources folder
2. Add `ensure mdx_gatesx` to your server.cfg
3. Configure gates in `config.lua`

## Configuration

Add gates to `config.lua`:

```lua
Config.Gates = {
    ['Station Name'] = {
        {
            GateCoords = vector3(x, y, z),           -- Gate spawn position
            GateRotation = vector3(0.0, 0.0, 0.0),   -- Gate rotation
            KeyCoordsOutside = vector3(x, y, z),     -- Interaction point outside
            KeyCoordsInside = vector3(x, y, z),      -- Interaction point inside
            InteractionDistance = 5.0,               -- Distance to interact
            model = `model_name`,                    -- Gate model hash
            animationDict = 'anim_dict',             -- Animation dictionary
            animationName = 'anim_name',             -- Animation name
        }
    },
}
```

## Controls

- **E** - Open/close gate when nearby

## Support

For issues or feature requests, open an issue on GitHub.
