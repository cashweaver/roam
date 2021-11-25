# cashweaver's Roam Notes

## `unread.org`

A list of unread articles/etc pulled, in most part, from my starred items in [Inoreader](http://inoreader.com).

### Create New Roam Node

1. Move `point` onto the heading for which you want to create a node.
1. Run `cashweaver-org-roam-new-node-from-link-heading-at-point` (see [Emacs configuration](https://github.com/cashweaver/dotfiles/blob/main/config/doom/config.org))

### Add Stars From Inoreader

1. Click "Download full archive" in Inoreader and unzip the file.
1. Run `eval "$(cat starred.json | jq -r '.items[] | [ "printf", "* TODO [[%s][%s]]\\n:PROPERTIES:\\n:CREATED: [%s]\\n:END:\\n", .canonical[0].href, .title, (.published | strftime("%Y-%m-%d %R")) ] | @sh')" >> unread.org`
