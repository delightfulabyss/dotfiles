return {
"jakewvincent/mkdnflow.nvim",
ft="md",
config = function()
require('mkdnflow').setup({
  mappings = {
    MkdnEnter = { { 'n', 'v', 'i' }, '<CR>' },
    MkdnTab = { { 'n', 'i' }, '<Tab>' },
    MkdnSTab = { { 'n', 'i' }, '<S-Tab>' },
    MkdnNextLink = false,
    MkdnPrevLink = false,
    MkdnNextHeading = { 'n', ']]' },
    MkdnPrevHeading = { 'n', '[[' },
    MkdnGoBack = { 'n', '<BS>' },
    MkdnGoForward = { 'n', '<Del>' },
    MkdnFollowLink = false, -- see MkdnEnter
    MkdnDestroyLink = { 'n', '<M-CR>' },
    MkdnTagSpan = { 'v', '<M-CR>' },
    MkdnMoveSource = { 'n', '<F2>' },
    MkdnYankAnchorLink = { 'n', 'ya' },
    MkdnYankFileAnchorLink = { 'n', 'yfa' },
    MkdnIncreaseHeading = { 'n', '+' },
    MkdnDecreaseHeading = { 'n', '-' },
    MkdnToggleToDo = { { 'n', 'v' }, '<C-Space>' },
    MkdnNewListItem = false,
    MkdnNewListItemBelowInsert = { 'n', 'o' },
    MkdnNewListItemAboveInsert = { 'n', 'O' },
    MkdnExtendList = false,
    MkdnUpdateNumbering = { 'n', '<leader>nn' },
    MkdnTableNextCell = { 'i', '<Tab>' },
    MkdnTablePrevCell = { 'i', '<S-Tab>' },
    MkdnTableNextRow = false,
    MkdnTablePrevRow = { 'i', '<M-CR>' },
    MkdnTableNewRowBelow = { 'n', '<leader>ir' },
    MkdnTableNewRowAbove = { 'n', '<leader>iR' },
    MkdnTableNewColAfter = { 'n', '<leader>ic' },
    MkdnTableNewColBefore = { 'n', '<leader>iC' },
    MkdnFoldSection = { 'n', '<leader>f' },
    MkdnUnfoldSection = { 'n', '<leader>F' }
  }
})
end }

