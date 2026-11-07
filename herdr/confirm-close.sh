#!/usr/bin/env bash
# Ask before closing the focused herdr pane. Bound to prefix+x in config.toml,
# where herdr runs it in a small popup and passes the focused pane, tab and
# space as HERDR_ACTIVE_* environment variables.
#
# The prompt names what will really go: closing a tab's only pane closes the
# tab, and closing a space's only tab closes the space too.

herdr="${HERDR_BIN_PATH:-herdr}"
pane="$HERDR_ACTIVE_PANE_ID"
tab="$HERDR_ACTIVE_TAB_ID"
space="$HERDR_ACTIVE_WORKSPACE_ID"

if [ -z "$pane" ]; then
    echo "herdr did not say which pane is focused; nothing closed."
    sleep 2
    exit 1
fi

tab_json=$("$herdr" tab get "$tab" 2>/dev/null)
panes=$(printf '%s' "$tab_json" | grep -o '"pane_count":[0-9]*' | cut -d: -f2)
label=$(printf '%s' "$tab_json" | sed -n 's/.*"label":"\([^"]*\)".*/\1/p')
tabs=$("$herdr" tab list --workspace "$space" 2>/dev/null | grep -o '"tab_id"' | wc -l | tr -d ' ')

if [ "$panes" != 1 ]; then
    what="this pane"
elif [ "$tabs" = 1 ]; then
    what="tab \"$label\" and its space (last tab)"
else
    what="tab \"$label\""
fi

printf 'Close %s? [y/N] ' "$what"
read -rsn1 answer
echo
case "$answer" in
    y|Y)
        if ! "$herdr" pane close "$pane" >/dev/null 2>&1; then
            echo "herdr refused to close it."
            sleep 2
        fi
        ;;
esac
