#!/usr/bin/env bash

# Path from where this script is called
__PATH__=`readlink -f ./`

echo "Updating data from veekun/pokedex..."

# CD to root path
cd ${__PATH__}

rm -rf csv

# Clone original data source from Veekun and move files
if [ -d "data_tmp/.git" ]; then
    cd data_tmp
    git checkout master
    git reset --hard
    git pull -f
    cd ..
else
    rm -rf data_tmp # in case it exists, but it's not a git repo.
    git clone https://github.com/veekun/pokedex.git data_tmp || exit 1
fi
cp -R data_tmp/pokedex/data/csv csv || exit 1
cp data_tmp/README csv/README || exit 1
cp data_tmp/LICENSE csv/LICENSE || exit 1

# Migrate CSV to the new schema
php scripts/migrate.php || exit 1

exit 0