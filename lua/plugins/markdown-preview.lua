return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    config = function()
        vim.g.mkdp_auto_start = 1
        vim.g.mkdp_auto_close = 0
        vim.g.mkdp_combine_preview = 1
        vim.g.mkdp_combine_preview_auto_refresh = 1
    end,
}
