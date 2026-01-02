Config = {}

Config.Gates = {
    ['Alperton Police Station'] = {
        {
            GateCoords = vector3(-1059.99536, -2034.64368, 12.249671),
            GateRotation = vector3(0.0, 0.0, -45.0),
            KeyCoordsOutside = vector3(-1064.41, -2033.49, 13.27),
            KeyCoordsInside = vector3(-1053.14, -2038.67, 12.73),
            InteractionDistance = 5.0, -- Must be defined
            model = `mdx_alp_bifolding`,
            animationDict = 'mdx@mdx_alp_bifold',
            animationName = 'mdx_alp_bifold',
        }
    },
    ['Pleato Police Station'] = {
        {
            GateCoords = vector3(-127.22, 6287.33, 32.12),
            GateRotation = vector3(0.0, 0.0, -45.0),
            KeyCoordsOutside = vector3(-127.22, 6287.33, 32.12),
            KeyCoordsInside = vector3(-127.22, 6287.33, 32.12),
            InteractionDistance = 5.0, -- Must be defined
            model = `mdx_lew_bifolding`,
            animationDict = 'clip@mdx_lew_bifolding',
            animationName = 'mdx_lew_bifolding',
        }
    },
    ['Test'] = {
        {
            GateCoords = vector3(-720.324, -1103.573, 11.903),
            GateRotation = vector3(0.0, 0.0, 0.0),
            KeyCoordsOutside = vector3(-720.324, -1103.573, 11.903),
            KeyCoordsInside = vector3(-720.324, -1103.573, 11.903),
            InteractionDistance = 5.0, -- Must be defined
            model = `mdx_med_lucas_1`,
            animationDict = 'clip@mdx_med_lucas_1',
            animationName = 'mdx_med_lucas_1.anim',
        }
    },
    ['Custom Police Station'] = {
        {
            GateCoords = vector3(-306.07843, 308.417175, 94.51337),
            GateRotation = vector3(0.0, 0.0, 0.0),
            KeyCoordsOutside = vector3(-302.86697387695, 296.76846313477, 91.656242370605),
            KeyCoordsInside = vector3(-309.45706176758, 311.18884277344, 93.12654876709),
            InteractionDistance = 5.0, -- Must be defined
            model = `mdx_ioap_el_gates`,
            animationDict = 'clip@mdx_ioap_el_gates',
            animationName = 'mdx_ioap_el_gates',
        }
    },
    ['NPAS Base'] = {
        {
            GateCoords = vector3(-709.548157, -1383.15027, 6.38),
            GateRotation = vector3(0.0, 0.0, -40.0),
            KeyCoordsOutside = vector3(-710.86, -1374.92, 5.27),
            KeyCoordsInside = vector3(-711.73, -1387.24, 5),
            InteractionDistance = 5.0, -- Must be defined
            model = `mdx_npas_gates`,
            animationDict = 'clip@mdx_npas_gates',
            animationName = 'mdx_npas_gates',
        }
    },
    ['ARV Base'] = {
        {
            GateCoords = vector3(-313.320343, -2680.46436, 7.50234747),
            GateRotation = vector3(0.0, 0.0, 45.0),
            KeyCoordsOutside = vector3(-313.417, -2671.588, 5.02833176),
            KeyCoordsInside = vector3(-302.367279, -2684.59888, 5.02833176),
            InteractionDistance = 9.0, -- Must be defined
            model = `mdxarv_gates`,
            animationDict = 'clip@mdxarv_gates',
            animationName = 'mdxarv_gates',
        }
    },
    ['Lewisham Police Station'] = {
        {
            GateCoords = vector3(375.66, -1702.72, 30.04),
            GateRotation = vector3(0.000, 0.000, 48.194),
            KeyCoordsOutside = vector3(375.66, -1702.72, 30.04),
            KeyCoordsInside = vector3(375.66, -1702.72, 30.04),
            InteractionDistance = 5.04, -- Auto Distance
            model = `mdx_lew_bifolding`,
            animationDict = 'clip@mdx_lew_bifolding',
            animationName = 'mdx_lew_bifolding',
        },
        {
            GateCoords = vector3(376.446, -1619.946, 30.064),
            GateRotation = vector3(0.0, 0.0, 143.0),
            KeyCoordsOutside = vector3(376.446, -1619.946, 30.064),
            KeyCoordsInside = vector3(376.446, -1619.946, 30.064),
            InteractionDistance = 5.04, -- Auto Distance
            model = `mdx_lew_bifolding`,
            animationDict = 'clip@mdx_lew_bifolding',
            animationName = 'mdx_lew_bifolding',
        }
    },
    ['Fire Station'] = {
        {
            GateCoords = vector3(-2095.84668, 4241.35547, 13.9692411),
            GateRotation = vector3(0.0, 0.0, 0.0),
            KeyCoordsOutside = vector3(-2095.84668, 4241.35547, 13.2192411),
            KeyCoordsInside = vector3(-2095.84668, 4243.35547, 13.2192411),
            InteractionDistance = 10.04, -- Auto Distance
            model = `mdxfirest_ext_doors`,
            animationDict = 'clip@mdxfirest_ext_doors',
            animationName = 'mdxfirest_ext_doors',
        },
        {
            GateCoords = vector3(-2095.84668, 4235.46875, 13.9692411),
            GateRotation = vector3(0.0, 0.0, 0.0),
            KeyCoordsOutside = vector3(-2095.84668, 4235.46875, 13.2192411),
            KeyCoordsInside = vector3(-2095.84668, 4237.46875, 13.2192411),
            InteractionDistance = 10.04, -- Auto Distance
            model = `mdxfirest_ext_doors`,
            animationDict = 'clip@mdxfirest_ext_doors',
            animationName = 'mdxfirest_ext_doors',
        },
        {
            GateCoords = vector3(-2076.98438, 4241.351, 13.9692411),
            GateRotation = vector3(0.0, 0.0, -180.0),
            KeyCoordsOutside = vector3(-2076.98438, 4241.351, 13.2192411),
            KeyCoordsInside = vector3(-2076.98438, 4239.351, 13.2192411),
            InteractionDistance = 10.04, -- Auto Distance
            model = `mdxfirest_ext_doors`,
            animationDict = 'clip@mdxfirest_ext_doors',
            animationName = 'mdxfirest_ext_doors',
        },
        {
            GateCoords = vector3(-2076.98438, 4235.477, 13.9692411),
            GateRotation = vector3(0.0, 0.0, -180.0),
            KeyCoordsOutside = vector3(-2076.98438, 4235.477, 13.2192411),
            KeyCoordsInside = vector3(-2076.98438, 4233.477, 13.2192411),
            InteractionDistance = 10.04, -- Auto Distance
            model = `mdxfirest_ext_doors`,
            animationDict = 'clip@mdxfirest_ext_doors',
            animationName = 'mdxfirest_ext_doors',
        }
    },
    ['Firearms Base 1'] = {
        {
            GateCoords = vector3(-753.622561, 5080.917, 4.3),
            GateRotation = vector3(0.0, 0.0, 90.0),
            KeyCoordsOutside = vector3(-755.631, 5086.798, 4.254),
            KeyCoordsInside = vector3(-747.973, 5074.374, 4.248),
            InteractionDistance = 5.0, -- Auto Distance
            model = `mdx_se_firearms_bifold`,
            animationDict = 'clip@mdx_se_firearms_bifold',
            animationName = 'mdx_se_firearms_bifold',
        },
        {
            GateCoords = vector3(-828.802063, 5028.751, 14.62),
            GateRotation = vector3(0.0, 0.0, 0.0),
            KeyCoordsOutside = vector3(-825.273, 5025.636, 13.279),
            KeyCoordsInside = vector3(-825.273, 5025.636, 13.279),
            InteractionDistance = 4.0, -- Auto Distance
            model = `mdx_se_firearmsbase_normalgates`,
            animationDict = 'clip@mdx_se_firearmsbase_normalgates',
            animationName = 'mdx_se_firearmsbase_normalgates',
        },
        {
            GateCoords = vector3(-828.802063, 5028.751, 14.62),
            GateRotation = vector3(0.0, 0.0, 0.0),
            KeyCoordsOutside = vector3(-831.947, 5032.618, 13.513),
            KeyCoordsInside = vector3(-831.947, 5032.618, 13.513513),
            InteractionDistance = 4.0, -- Auto Distance
            model = `mdx_se_firearmsbase_normalgates2`,
            animationDict = 'clip@mdx_se_firearmsbase_normalgates2',
            animationName = 'mdx_se_firearmsbase_normalgates2',
        },
    },
}