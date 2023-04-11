local telescope = require('telescope')

telescope.load_extension('media_files')
telescope.load_extension('projects')
telescope.load_extension('gh')

telescope.setup({
	defaults = {
		mappings = {
			n = {
      } --whichkey stuff
		},

		pickers = {
      find_files = {
        follow = true
      }
    },
		extesions = {
      media_files = {
        find_cmd = "rg"
      },
      projects = {},
      gh = {}
    }
	}
})
