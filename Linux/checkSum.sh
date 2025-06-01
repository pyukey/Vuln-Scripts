[ "$(sha256sum $1 | cut -d ' ' -f1)" = "$(sha256sum $2 | cut -d ' ' -f1)" ] && echo "Same" || echo "Different"
