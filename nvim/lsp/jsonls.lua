return {
	-- List of available schemas: https://www.schemastore.org/json/
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
		yaml = {
			schemas = require("schemastore").yaml.schemas(),
			validate = { enable = true },
		},
	},
}
