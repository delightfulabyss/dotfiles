local colors = require("tokyonight.colors").setup()

return {
	"LeonHeidelbach/trailblazer.nvim",
	event = "BufEnter",
	config = function()
		require("trailblazer").setup({
			lang = "en",
			trail_options = {
				available_trail_mark_modes = {
					"global_chron",
					"global_buf_line_sorted",
					"global_chron_buf_line_sorted",
					"global_chron_buf_switch_group_chron",
					"global_chron_buf_switch_group_line_sorted",
					"buffer_local_chron",
					"buffer_local_line_sorted",
				},
				current_trail_mark_mode = "global_chron",
				current_trail_mark_list_type = "quickfix", -- currently only quickfix lists are supported
				verbose_trail_mark_select = true, -- print current mode notification on mode change
				mark_symbol = " .", --  will only be used if trail_mark_symbol_line_indicators_enabled = true
				newest_mark_symbol = " ", -- disable this mark symbol by setting its value to ""
				cursor_mark_symbol = " ", -- disable this mark symbol by setting its value to ""
				next_mark_symbol = " ", -- disable this mark symbol by setting its value to ""
				previous_mark_symbol = " ", -- disable this mark symbol by setting its value to ""
				multiple_mark_symbol_counters_enabled = true,
				number_line_color_enabled = true,
				trail_mark_in_text_highlights_enabled = true,
				trail_mark_symbol_line_indicators_enabled = true, -- show indicators for all trail marks in symbol column
				symbol_line_enabled = true,
				default_trail_mark_stacks = {
					"default", -- , "stack_2", ...
				},
				available_trail_mark_stack_sort_modes = {
					"alpha_asc", -- alphabetical ascending
					"alpha_dsc", -- alphabetical descending
					"chron_asc", -- chronological ascending
					"chron_dsc", -- chronological descending
				},
				current_trail_mark_stack_sort_mode = "alpha_asc",
				hl_groups = {
					TrailBlazerTrailMark = {
						guifg = colors.magenta,
						guibg = "none",
						gui = "bold",
					},
					TrailBlazerTrailMarkNext = {
						guifg = colors.green,
						guibg = "none",
						gui = "bold",
					},
					TrailBlazerTrailMarkPrevious = {
						guifg = colors.cyan,
						guibg = "none",
						gui = "bold",
					},
					TrailBlazerTrailMarkCursor = {
						guifg = colors.blue,
						guibg = "none",
						gui = "bold",
					},
					TrailBlazerTrailMarkNewest = {
						guifg = colors.orange,
						guibg = "none",
						gui = "bold",
					},
					TrailBlazerTrailMarkGlobalChron = {
						guifg = "Black",
						guibg = "Red",
						gui = "bold",
					},
					TrailBlazerTrailMarkGlobalBufLineSorted = {
						guifg = "Black",
						guibg = "LightRed",
						gui = "bold",
					},
					TrailBlazerTrailMarkGlobalChronBufLineSorted = {
						guifg = "Black",
						guibg = "Olive",
						gui = "bold",
					},
					TrailBlazerTrailMarkGlobalChronBufSwitchGroupChron = {
						guifg = "Black",
						guibg = "VioletRed",
						gui = "bold",
					},
					TrailBlazerTrailMarkGlobalChronBufSwitchGroupLineSorted = {
						guifg = "Black",
						guibg = "MediumSpringGreen",
						gui = "bold",
					},
					TrailBlazerTrailMarkBufferLocalChron = {
						guifg = "Black",
						guibg = "Green",
						gui = "bold",
					},
					TrailBlazerTrailMarkBufferLocalLineSorted = {
						guifg = "Black",
						guibg = "LightGreen",
						gui = "bold",
					},
				},
			},
		})
	end,
}
