# 
.ONESHELL:


.PHONY: prepare-recipe
prepare-recipe:
	scripts/prepare-recipe.sh

.PHONY: conda-build
conda-build:
	cd recipe
	conda build purge && conda mambabuild .
