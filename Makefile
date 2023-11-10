fmt:
	echo "===> Formatting"
	stylua after/ --config-path=.stylua.toml
	stylua lua/ --config-path=.stylua.toml


lint:
	echo "===> Linting"
	luacheck after lua --read-globals -u

pr-ready: fmt lint
