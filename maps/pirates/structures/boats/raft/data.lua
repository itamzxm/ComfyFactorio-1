-- This file is part of thesixthroc's Pirate Ship softmod, licensed under GPLv3 and stored at https://github.com/danielmartin0/ComfyFactorio-Pirates.


local Public = {}

Public.display_name = 'raft'
Public.capacity = 11
Public.tile_areas = {
	{{-9,-4},{0,5}},
}
Public.width = 9
Public.height = 9
Public.spawn_point = {x = -3, y = 0}
Public.areas_infront = {
	{{0,-4},{1,5}},
}
Public.areas_behind = {
	{{-10,-4},{-9,5}},
}
Public.areas_offright = {
	{{-9,5},{0,6}},
}
Public.areas_offleft = {
	{{-9,-5},{0,-4}},
}
Public.entities = {
	inaccessible = { --this 'left wall' stops biters from being deleted by water
		pos = { x = -8.5, y = 0},
		bp_str = [[0eNqV08sOwiAQBdB/mTU1ltIXv2KMqXZSSdqhKfhoDP9uQRcmsmF5k7mHWQwvOI83nBdFFuQLDHVzZnU2LKr3+QkyZ7CCbB0DddFkQB62MTVQN/oBu84IEpTFCRhQN/n00LpHyi5XNBZ8kXr0kjsyQLLKKvw4Iawnuk1nXMJTMYHBrM1W0vRdab8rw1L5rnSO/TE8kdnHmSKRKeKMSGR4nCkTmTLOVImMiDN1IlPHmSaRqeJMm8g0ntluMVyt/PkBDO64mFDgTS7qlteiqETLG+fekGkHZg==]],
	},
}

Public.landingtrack = {
	offset = {x = -3, y = 0},
	bp = [[0eNqV2M1qwkAUhuF7mXUEz/wnt1JcpDrIgE5CMi0Vyb3XqIsu2uK7ksCXCXm+s/Dkqt5PH2mccqmqu6q59OOmDpvjlA/r9ZfqRDfqcvtxS6Pyfiiz6t5uwXws/WmN1MuYVKdyTWfVqNKf16tbbj+lmtR6Uzmk9Zxl16iaT+lxwDjMueahPJ+yvT9ku/x2wh9hIWGNTmZpg9L2tbQQECEgQkAEgQgCEQSiCYgmIJqAaASiEYhGIIaAGAJiCIhBIAaBGARiCYglIJaAWARiEYhFII6AOALiCIhDIA6BOATiCYgnIJ6AeATiEYhHIIGABAISCEhAIAGBBAQSCUgkIJGARAQSEUhEIC0BaQlIS0AeYUPC6AUdCXsSDiQcSbhFpbAKUYeCShTU4sv/l9EGIWiFELRDPNMGpdlbOpT2KB1QOqJ0y9qBZbI2hdUprM+Xx5bteWzRY5ueoLEVNLaCxlbQ2AoaW0FjK2hshY2tsLGFqzjcxf9bxnfN4/NO9+NjUaM+0zTfD9BRbGh1cM5aF/yyfAPSTNjI]],
}

return Public