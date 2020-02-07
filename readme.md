# Database Exercises

## How to move a folder to the right place

```
mv ~/Desktop/codeup-data-science ~/
```

paths can be relative or absolute

## How to remove a git repo (locally)

0. Make sure your certain you want to remove the repo

```
cd ~/path/to/repo_to_remove
pwd
rm -rf .git
```

## Working With SQL Pro

- make sure you choose "Save Query", *not* "Save Connection" and save the file *with* the `.sql` extension
- how to save files in the right place

## How to remove a file from git

1. Remove the file
2. add and commit the fact that we removed the file

```
rm file_to_delete
git add file_to_delete
git commit -m "Removed the file to delete"
```

## How to search for a file or directory on the command line

The `find` command

```
find ~/codeup-data-science -name '*codeup*'
```
