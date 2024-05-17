# Setting up bare git projects

```bash
mkdir [yourproject]
cd ./[yourproject]
git init --bare bare.git
git clone ./bare.git main
cd ./main
touch README.md
git add -A
git commit -m "Initial commit"
git push origin main
cd ../bare.git
git remote add origin [yourgithubrepo]
git branch -M main
git push -u origin main
```
