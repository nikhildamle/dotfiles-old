#!/usr/bin/env bash

cd

dotfiles_dir=$HOME/dotfiles
dotfiles_backup_dir=$HOME/dotfiles_backup
time_stamped_backup_dir=$dotfiles_backup_dir/$(date +"%s")

function toLower {
  echo $1 | tr '[:upper:]' '[:lower:]'
}

read -e -p "This may overwite files in your home directory. Continue? (yes/no): " -i "no" ANSWER
if [ $(toLower $ANSWER) != "yes" ] ; then
  echo 'Exit. No changes are made'
  exit
fi

echo "Glad to hear"
mkdir -p $dotfiles_backup_dir
mkdir -p $time_stamped_backup_dir
echo 'Check for hidden files in this backup directory' > $time_stamped_backup_dir/README.txt

function backup_dotfile {
  if [ -L $1 ]; then
    rm $1
  elif [ -e $1 ]; then
    mv $1 $time_stamped_backup_dir
  fi
}
echo "Copying Directories..."
for file in $(find -L $dotfiles_dir -name *.copy); do
  dotted_file_name=.$(basename $file .copy)
  backup_dotfile $dotted_file_name
  cp -R $file $HOME/$dotted_file_name
done

echo "Symlinking Directories..."
for file in $(find -L $dotfiles_dir -name *.symlink); do
  link_name=.$(basename $file .symlink)
  backup_dotfile $link_name
  ln -s $file $HOME/$link_name
done
for file in $(find -L $dotfiles_dir -name *.nodotsymlink); do
  link_name=$(basename $file .nodotsymlink)
  backup_dotfile $link_name
  ln -s $file $HOME/$link_name
done

# Source init file which contains helper functions
# needed for the firstrun scripts
source $dotfiles_dir/bash/init

echo "Running Init scripts. Hang tight"
for file in $(find -L $dotfiles_dir -name *.firstrun); do
  bash $file
done

echo -e "\e[32m Done. Some of these changes require a logout/restart to take effect.\e[0m"
