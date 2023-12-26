# Setter

![setter](https://i.imgur.com/EYw5s9k.png)

## How to setup?

- Create a directory for permanent storage (e.g., ~`/scripts`):
```bash
mkdir -p ~/scripts
mkdir -p ~/scripts/bin
```

- Clone this repo:
```bash
cd ~/scripts
git clone https://github.com/minhnguyent546/setter-script.git setter
```

- Create a symbolic link to executable file:
```bash
ln -s setter/bin/setter bin/setter
```

- Finally, add `bin` to your `PATH` variable so you can execute it from any location:
```bash
echo 'export PATH="${PATH}:~/scripts/bin"' >> ~/.bashrc
source ~/.bashrc
```

- Check if it works by running the following command:
```bash
setter --version
```
