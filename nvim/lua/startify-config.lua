local g = vim.g

-- g.startify_custom_header = {
-- '',
-- '',
-- '                                       ██            ',
-- '                                      ░░             ',
-- '    ███████   █████   ██████  ██    ██ ██ ██████████ ',
-- '   ░░██░░░██ ██░░░██ ██░░░░██░██   ░██░██░░██░░██░░██',
-- '    ░██  ░██░███████░██   ░██░░██ ░██ ░██ ░██ ░██ ░██',
-- '    ░██  ░██░██░░░░ ░██   ░██ ░░████  ░██ ░██ ░██ ░██',
-- '    ███  ░██░░██████░░██████   ░░██   ░██ ███ ░██ ░██',
-- '   ░░░   ░░  ░░░░░░  ░░░░░░     ░░    ░░ ░░░  ░░  ░░ ',
-- '',
-- '',
-- }

-- g.startify_custom_header = {
-- '',
-- '',
-- "MMMxoolKMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM0looxMMM",
-- "MKlOMMWoMMMMMMMMMMX0kkkxxxkk0XWMMMMMMMMMcWMMkoKx",
-- "oKWMMMOoMMMMMWOdolcodxxxxxxdoccldkNMMMMWc0MMMMKo",
-- "lKN0OWMKdkNklcoxxxxxdollllodxxxxxoclxNkxXMWk0X0l",
-- "MK0XXxxWMXo;ddddlccccloooolcccccoddd;lXMNxxXX0KM",
-- "MMMMMMNcdNMNo::coxxxxxxxxxxxxxxdc:;oNMNd:NMMMMMM",
-- "MMMMMWo:o:o0olxxxxxxxxxxxxxxxxxxxxolko:oclWMMMMM",
-- "MMMMMl:oooc,dollcc::::::::::::ccclod:;oooc:WMMMM",
-- "MMMMk,oll:.....''',,,,,,,,,,,,'''.....,loo:dMMMM",
-- "MMKx::ccloollloddddxxxxxxxxxxddddoolclolcc:;xKMM",
-- "MX'oxxxxd:OXWMWOdodOWMMMMMMWOdodkNMWX0coxxxxo'KM",
-- "MMWO'::::cMMWo       oWMMMx.      cWMMd,:::.xWMM",
-- "MMMM:llll,WMd         oMMk         cMMcclll,WMMM",
-- "MMMMd;ccc;oMd         dMMO         lMO,ccc:lMMMM",
-- "MMMMW;:ccc,xMd.     .dWWWMk.      lW0,cccc'XMMMM",
-- "MMMMMN;:ccc;lXW0xdx0WMl  oMW0xdxOWWd;ccc:,KMMMMM",
-- "MMMMMMWc,::,oxxKMMMMMMO::0MMMMMMXkxo,::;:NMMMMMM",
-- "MMMMMMMMd,dNMXo';oO0XWMMMMWN0Od;'lNMNd,dMMMMMMMM",
-- "MMMMMMXdkWMKc'::.lO0cOOldOO:00d.::'cXMWkxXMMMMMM",
-- "W0O0KdkWMKdONOo:.cK:k0KldKKxcKo.;lkNOdKMWkdKKO0W",
-- "cXWX0MM0dOMMMMMM0lOdOO0lxKOOoOdxMMMMMMOdKMM0KWXl",
-- "dONMMMOoMMMMMMMMM0oKMWXKKXWMXokMMMMMMMMMc0MMMNOo",
-- "MXoxMMNoMMMMMMMMMMWOxkkkkkkxkWMMMMMMMMMMcNMMxoXM",
-- "MMMkcccXMMMMMMMMMMMMMMMNNMMMMMMMMMMMMMMMKccckMMM",
-- '',
-- '',
-- }
g.webdevicons_enable_startify = 1
g.startify_enable_special = 0
g.startify_session_autoload = 1
g.startify_session_delete_buffers = 1
g.startify_change_to_vcs_root = 1
g.startify_fortune_use_unicode = 1
g.startify_session_persistence = 1

g.startify_lists = {
  { type = "sessions", header = {"   Sessions"} }, 
  { type = "files", header = {"   Files"} },
  { type = 'dir', header = { "   Current Directory "..vim.fn.getcwd()..":" } },
  { type = 'bookmarks', header = { '   Bookmarks' } }
}

g.startify_bookmarks = {
  { ipa = '~/packages/ipa_navigation_ws/src/ipa_navigation'},
  { bmw = '~/packages/bmw_ws/src/bmwstr'},
  { res = '~/packages/single-robot-backend'},
  { vrc = '~/.config/nvim'},
}
