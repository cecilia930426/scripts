#GitHub Users Guide

## Index
untracked - unmodified - modified - staged
                   ---edit->   --stage->
    <---remove---  <-------commit-------
    ----------------add---------------->

Git Basic
    Log:    Record Commit Information
    Undo:
    Compare:
    Tag:

Branch
Git Server
Distributed Git

Initial Unmodified State

        edit        stage           commit              add
git     modify      git add/rm      git commit -m       git add
svn     modify      svn add/rm      svn commit -m       svn add

# check version difference
svn diff -r 449:345 file


## Background
simply copy in time-stampe sequency: Easily to forget the directory
Local Version Control System: - RCS
Centralized Version Control System (CVCS): single point of central server failure, lose everything
Distributed Version Control System (DVCS): client don't just check out, but fully mirror the repository

Major Difference between : Git thinks about its data.
Git Basics <https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository>

##Create a new repository
```
echo "# Windows-Move-and-Switch" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/shakir-chen/Windows-Move-and-Switch.git
git push -u origin master
```

##Push an existing repo
```
git remote add origin https://github.com/shakir-chen/Windows-Move-and-Switch.git
git push -u origin master
```

##Git Status Check
```
git status
git status -s   # Short Status
```
See what you've changed but not yet staged
```
git diff
git diff --staged # compares your staged changes  equal to : git diff --cached
```
View the commit history

```
git log
git log -p -2       # -p shows the difference introduced in each commit; -2 limits optput to only the last two entries
git log -stat       # abbreviation
git log --pretty=oneline    #changes the log outputs to format,  full,short,fuller
```

##Search
```
git grep "foo()"
```

##Branch
```
git checkout -b iss53   #swtich to a new version shorthand for  git branch iss53  && git checkout iss53
vim XXX                 #Make some change
git commit -a -m 'info' #commit to iss53 branch

git checkout master     #switch back to master branch

git checkout -b hotfix  #swtich to a new version hotfix, and it is what you want
vim XXX                 #Make some change
git commit -a -m 'info' #commit to iss53 branch

git checkout master
git merge hotfix        #git simply move pointer Master to pointer hotfix, which calls fast-forward
```
Still Much to learn

show branch info
```
git show-branch
```

<https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging>

### Show Merge Info
```
$git log

commit a628029cea60f9a45c26e6129967b45d73a2d1fc
Merge: 609e915 26de355
Author: shakir-chen <chenxuanqi93@gmail.com>
Date:   Mon Jun 5 18:47:29 2017 +0800

    Merge branch 'master' of https://github.com/shakir-chen/Scripts
$git show -m a628029
$git show --first-parent a628029
$git diff a628029^ a628029

$git show -m -1         # the last commit information
$git show -m -2         # the last 2 commit information
```

##Undo
Can't always undo some of these undos!!
May lose some work Here.
```
git commit --amend          #want to commit as the formal commit with same infos
git reset HEAD <Files>      #unstage a staged files
git checkout -- <Files>     #unmodify a modified file, dangerous command
```
```
git reset --hard    #back to the commit stage
git clean -f        #clean all untrack files
```
Anything that is committed in Git can almost always be recovered. Even in Branches, use --amend commit can be recovered.

##Working with Remote
```
git remote                              #showing your remote
git remote -v                           #showing your remote with fetch and push
git remote add <shortname> <url>        #adding remote repository
```
#### Update or fetch a Rep
```
git pull
git fetch [remotename]                  #get date from remote projects
git push [remote-name] [branch-name]    #origin master
```
#### Inspect a remote
```
git remote show origin
git remote rename pb paul       #rename pb as paul
```

##Tag
```
git tag
git tag -l "v1.8.5*"
git tag -a v1.4 -m "my version 1.4"         #Annoted Tags
    git show v1.4
git tag v1.4-lw                             #light weight Tags
    git show v1.4-lw
git tag -a v1.2 9fceb02                     #9fceb02 is part of checksum, tag later
git push origin v1.5                        #transfer tags to remote servers
git checkout -b [branchname] [tagname]      #put a version with specific name by creating a new branch, carefully
```

## Git Push without username, password
```
ssh-keygen -t rsa
copy rsa content to Github
git remote set-url origin git+ssh://git@github.com/username/reponame.git    #reset your URL insted of https://github.com/username/reponame.git
git remote show origin  #check
ssh -T git@github.com   #check ssh connection situation
```
<http://stackoverflow.com/questions/8588768/git-push-username-password-how-to-avoid>

#git server
```
$ git clone --bare my_project my_project.git
$ git remote add origin ~/Research/Benchmark-Tools.git          #To set the remote
```


git on server - git-upload-pack command not found problem
```
>cd /etc/ssh/sshd_config
PermitUserEnvironment yes
>/etc/init.d/sshd restart

Test on local-PC
>ssh username@hostserver "which git-upload-pack"
```
<http://stackoverflow.com/questions/11128464/git-upload-pack-command-not-found>
Git Guide Setup Guide : <https://git-scm.com/book/en/v1/Git-on-the-Server-Getting-Git-on-a-Server>


## Problem Solution
git clone ssh://username@hostname:~path/to/git/repository/XXX.git
fatal: Unable to find remote helper for 'https'
upload-pack-command-not-found
'''
in /etc/ssh/sshd_config add:
PermitUserEnvironment yes

in .ssh/ directory
env > .ssh/environment #dump envronment to .ssh/enviroment:
'''
<http://stackoverflow.com/questions/11128464/git-upload-pack-command-not-found>

## Revert to previous version
```
svn log -l2         # check previous two information
svn up -r r10489    # update to previous version
```
svn revert tran.pdf     # get back the removed file

meet conflicts, very tough

##Reference
Good Summary<https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell>
<https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control>

