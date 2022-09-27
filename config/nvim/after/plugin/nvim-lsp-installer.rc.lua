local status, nvim_lsp_installer = pcall(require, 'nvim-lsp-installer')
if (not status) then return end

nvim_lsp_installer.setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
		-- Whether to automatically check for outdated servers when opening the UI window.
        check_outdated_servers_on_open = true,
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        },
		keymaps = {
            -- Keymap to expand a server in the UI
            toggle_server_expand = "<CR>",
            -- Keymap to install the server under the current cursor position
            install_server = "i",
            -- Keymap to reinstall/update the server under the current cursor position
            update_server = "u",
            -- Keymap to check for new version for the server under the current cursor position
            check_server_version = "c",
            -- Keymap to update all installed servers
            update_all_servers = "U",
            -- Keymap to check which installed servers are outdated
            check_outdated_servers = "C",
            -- Keymap to uninstall a server
            uninstall_server = "X",
        },
    },
})
