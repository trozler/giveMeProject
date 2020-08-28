#/bin/bash

GREEN='\033[0;32m'
NC='\033[0m'
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )""/"
BASE="$( basename $PWD | tr '[:upper:]' '[:lower:]' )"

printf "\e${GREEN}Doing your lazy work...\e${NC}\n"

git init -q
touch .gitignore README.md
printf "## $BASE\n" >> ./README.md

printf "\e${GREEN}git stuff done.\e${NC}\n"
mkdir src src/css src/js dist
touch src/js/index.js src/indexSrc.html src/css/styles.css

cp "${DIR}""webpack.config.js" "${PWD}"
cp "${DIR}"".babelrc" "${PWD}"
cp "${DIR}"".gitignore" "${PWD}"
cp "${DIR}""LICENSE" "${PWD}"

printf "\e${GREEN}repo structure done.\e${NC}\n"

npm init -y
rm "${PWD}""/package.json"
cp "${DIR}""package.json" "${PWD}"
sed -i '' 's/"name": "[a-zA-z]*",/"name": "'$BASE'",/' ./package.json
npm install -D babel-loader @babel/core @babel/preset-env @babel/plugin-transform-runtime
npm install -D webpack webpack-cli

#Add to github?
while true; do
    read -p "Add this project to github (y or n)? " YNtoHub
    case $YNtoHub in
        [Yy]* ) YNtoHub=1; break;;
        [Nn]* ) YNtoHub=0; break;;
        * ) echo "Please answer y or n";;
    esac
done

if [ $YNtoHub -eq 1 ]
then
    #Public or private?
    while true; do
        read -p "Private repo (y or n)? " YNtoVisibility
        case $YNtoVisibility in
            [Yy]* ) YNtoVisibility=1; break;;
            [Nn]* ) YNtoVisibility=0; break;;
            * ) echo "Please answer y or n";;
        esac
    done

    if [ $YNtoVisibility -eq 0 ]
    then
        gh repo create --public
    else
        gh repo create
    fi

    git add .
    git commit -m "Hello there new repo."
    git push -u origin master
fi

printf "\e${GREEN}All done.\e${NC}\n"
