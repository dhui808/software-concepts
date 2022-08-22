### Discard changes to a local file
    git checkout filename
    
### Unstage a file
    git reset HEAD <file>
    
### Merge develop branch to main branch
    git checkout main
    git merge --no-ff develop
    git push

### Create new repo openshifttest:
    git init  
    git add README.md  
    git commit -m "first commit"  
    git branch -m main  
    git remote add origin https://github.com/dhui808/openshifttest.git  
    git push -u origin main  

### How to clean all commit history?
    Delete .git from local file system  
    git init  
    git commit -m "new commit"  
    git branch -m main  
    git remote add origin https://github.com/dhui808/openshifttest.git  
    git push -f origin main

### How to roll back "develop" branch to a specific tag "PRE_REL_1.1"?
    https://stackoverflow.com/questions/6872223/how-do-i-revert-master-branch-to-a-tag-in-git  
    git checkout develop  
    git reset --hard PRE_REL_1.1  
    git push --force origin develop  

### How to roll back "main" branch to a specific commit "4f6e03d"?
    git reset --hard 4f6e03d  
    git push --force origin main 
  
### How to switch git branch
    git checkout branch_name

### How to create new branch from the current branch and push it to remote?
    git checkout -b new_branch  
    git push -u origin new_branch  
    Note: unstaged local changes are not committed and pushed to the remote.  

### How to display the parent branches of the current branch?
    git log --decorate --simplify-by-decoration --oneline

### How to undo the latest commit?
    git reset HEAD~  

### To discard local changes to all files, permanently: 
    git reset --hard
  
### How to revert a merge commit that's already pushed to remote branch?
    git reset --hard <commit-hash-prior-to-merge>  
    git push -f origin <remote-branch-name>
  
  Another approach from SourceTree:
  Right-click the previous commit where we want to go back to – > Reset feature/myfeature to this commit

### How to revert a commit pushed to the remote repo?
    git log  
    git revert 29ce4c1  
    git push
 
### How to delete a local branch?
    git branch -d <branch_name>
    
### git pull does not pull the latest updates
    git fetch origin develop
    git reset --hard FETCH_HEAD

### git [ERROR] Invalid syntax in configuration ini file
    Try commiting with the -n (--no-verify) flags
    
### fatal: unable to access 'https://github.com/myid/myrepo/': SSL certificate problem: self signed certificate in certificate chain
    Intermittent. Go to the parent folder. git pull works without the above error
    
### find all files user modified since 4 months ago:
    git log --since="4 months ago" --name-only --author="user002" --pretty=format: | sort | uniq
