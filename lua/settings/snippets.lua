local ls = require"luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local events = require("luasnip.util.events")

ls.config.set_config {
	history = true,
	-- region_check_events = "CursorMoved,CursorHold,InsertEnter",
	-- delete_check_events = "InsertLeave",
	enable_autosnippets = true,
}

-- args is a table, where 1 is the text in Placeholder 1, 2 the text in
-- placeholder 2,...
local function copy(args)
	return args[1]
end

ls.snippets = {
	all = {
		s("banner", {
		t({"// ===== ===== ===== ===== ", "\t"}),
		t("// "),
		i(1),
		t({"\t","// ===== ===== ===== ====="}),
		i(2)
		})
	},
	rust = {
		s("testfn", {
			-- Simple static text.
			t("//Parameters: "),
			-- function, first parameter is the function, second the Placeholders
			-- whose text it gets as input.
			f(copy, 2),
			t({ "", "function " }),
			-- Placeholder/Insert.
			i(1),
			t("("),
			-- Placeholder with initial text.
			i(2, "int foo"),
			-- Linebreak
			t({ ") {", "\t" }),
			-- Last Placeholder, exit Point of the snippet. EVERY 'outer' SNIPPET NEEDS Placeholder 0.
			i(0),
			t({ "", "}" }),
		}),

		s("func", {
			-- Simple static text.
			-- t("//Parameters: "),
			-- function, first parameter is the function, second the Placeholders
			-- whose text it gets as input.
			-- f(copy, 2),
			t({ "", "fn " }),
			-- Placeholder/Insert.
			i(1, "func_Name"),
			t("("),
			-- Placeholder with initial text.
			i(2, "parameters"),
			-- Linebreak
			t({ ") {", "\t" }),
			-- Last Placeholder, exit Point of the snippet. EVERY 'outer' SNIPPET NEEDS Placeholder 0.
			i(0),
			t({ "", "}" }),
		}),


		s("test", {
			-- Simple static text.
			-- t("//Parameters: "),
			-- function, first parameter is the function, second the Placeholders
			-- whose text it gets as input.
			-- f(copy, 2),
			t({ "", "fn " }),
			-- Placeholder/Insert.
			i(1, "func_Name"),
			t("("),
			-- Placeholder with initial text.
			i(2, "parameters"),
			-- Linebreak
			t({ ")"}),
			c(3, {
				t(" "),
				t(" -> ")
			}),
			t({"{", "\t" }),
			-- Last Placeholder, exit Point of the snippet. EVERY 'outer' SNIPPET NEEDS Placeholder 0.
			i(0),
			t({ "", "}" }),
		}),
		-- println
		s("pr", {
			t("println!("),
			i(1, ""),
			t(");")
		})

	},
	javascript = {
		-- Function
		s("fn", {
			-- Simple static text.
			t("//Parameters: "),
			-- function, first parameter is the function, second the Placeholders
			-- whose text it gets as input.
			f(copy, 2),
			t({ "", "function " }),
			-- Placeholder/Insert.
			i(1, "func_name"),
			t("("),
			-- Placeholder with initial text.
			i(2, "Parameters"),
			-- Linebreak
			t({ ") {", "\t" }),
			-- Last Placeholder, exit Point of the snippet. EVERY 'outer' SNIPPET NEEDS Placeholder 0.
			i(0),
			t({ "", "};" }),
		}),
		s("cl", {
			t("console.log("),
			i(1, ""),
			t(");")
		})
	}
}


require("luasnip.loaders.from_vscode").load {
	paths = vim.fn.stdpath "config" .. "/snippets",
}
