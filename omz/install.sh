#!/bin/zsh

Dest="$HOME/.config/my"
if [[ ! -d $Dest ]]; then
	mkdir -p $Dest;
else
	echo "Directory already exists :: $Dest";
fi

srcf="$PWD/myz.sh"
targetf="$Dest/myz.sh"
if [[ -f $srcf ]]; then
	if [[ ! -f $targetf ]]; then
		ln -s "$srcf" "$targetf"
	else
		echo "Link file exists, continue";
	fi
else
	echo "File not exist, abort :: $srcf";
	exit;
fi

zrc=$HOME/.zshrc
sourcing="source \$HOME/.config/my/myz.sh"
grep "$sourcing" $zrc > /dev/null || echo $sourcing >> $zrc && echo "DONE"
