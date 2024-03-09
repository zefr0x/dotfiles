_default:
	@just --list

lint_all:
	pre-commit run --all-files

todo:
	rg "(.(TODO|FIX|HACK|WARN|PREF|NOTE): )" --glob !{{ file_name(justfile()) }}

# vim: set ft=make :
