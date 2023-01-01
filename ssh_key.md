```
ssh-keygen -t ed25519 -C "ltkhai16@gmail.com"
```
```
eval "$(ssh-agent -s)"
```
```
ssh-add ~/arch-setup/ssh/id_ed25519
```
```
cat ~/arch-setup/ssh/id_ed25519.pub
```
