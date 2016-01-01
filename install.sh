#!/bin/bash

BASE_DIR=$(dirname $0)
BACKUP_DIR="$BASE_DIR/backup/$(date +%Y%m%d%H%M%S)"
SOURCE_DIR="$BASE_DIR/.profile.d"
SOURCE_PROFILE="$BASE_DIR/.bash_profile"
DEST_DIR="$HOME/.profile.d"
DEST_PROFILE="$HOME/.bash_profile"

if [ -d $DEST_DIR ]; then
	echo "Backing up $DEST_DIR to $BACKUP_DIR"
	mkdir -p $BACKUP_DIR
	cp -vR $DEST_DIR $BACKUP_DIR
fi

if [ -f $DEST_PROFILE ]; then
	echo "Backing up $DEST_PROFILE to $BACKUP_DIR"
	mkdir -p $BACKUP_DIR
	cp -vR $DEST_PROFILE $BACKUP_DIR
fi

echo "Updating $DEST_PROFILE and $DEST_DIR"
cp -vf $SOURCE_PROFILE $DEST_PROFILE
cp -vfR $SOURCE_DIR $DEST_DIR

echo "All done"
