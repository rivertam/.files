in_wsl = os.getenv('WSL_DISTRO_NAME') ~= nil

if in_wsl then
    vim.g.clipboard = {
        name = 'wsl clipboard',
        copy =  { ["+"] = { "clip.exe" },   ["*"] = { "clip.exe" } },
        paste = {
            ["+"] = { 'nvim_paste' },
            ["*"] = { 'nvim_paste' },
        },
        cache_enabled = true
    }
end

vim.opt.clipboard = "unnamedplus"
