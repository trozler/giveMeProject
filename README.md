## giveMeProject - simple front-end boilerplate

![Shell][1]![License][3]![js][2]

[1]: https://img.shields.io/badge/Shell-Bash-89e051
[2]: https://img.shields.io/badge/-javascript-%23f1e05a
[3]: https://img.shields.io/badge/license-MIT-orange

I thought it would be nice to automate the creation of some folders and files I use for my front-end only projects. So thats what this does.

More specifically it does the followin:

- Initialises a local git repo, with README and .gitignore files.
- Initialises a node project with a package.json file.
- Installs webpack and babel dependencies.
- Creates basic babel and webpack configurations.
- Gives you the option to create a private or public github repo.

**Note/** All configuration files contain the default configs I use for my front-end only projects. They are not exhaustive and you are encouraged to add your own :).

At the end you repo should look like this:

```
.
├── LICENSE
├── README.md
├── dist
├── node_modules
├── package-lock.json
├── package.json
├── src
│   ├── css
│   ├── indexSrc.html
│   └── js
├── .gitignore
├── .babelrc
└── webpack.config.js
```

## Installation

```
$ cd ~
$ git clone  https://github.com/trozler/giveMeProject.git
```

I recommend adding the following alias to your bashprofile (`~/.bash_profile`).
`~/.bashrc` should also work.

```
$ echo -e '\nalias givemeweb="/bin/bash ~/giveMeProject/webproject.sh"' >> ~/.bash_profile
$ source ~/.bash_profile
```

Then just create a new folder, go into it and run `givemeweb`.

For example:

```
$ mkdir myrepo
$ cd myrepo
$ givemeweb
```

## Dependencies

- [Github CLI](https://cli.github.com/manual/)
- [npm](https://www.npmjs.com/)
