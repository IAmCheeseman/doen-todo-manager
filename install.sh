#! /usr/bin/bash

if $1 != "skip"
then
    echo "Installing hxcpp..."
    if command -v doas &> /dev/null
    then
        doas haxelib install hxcpp
    else 
        sudo haxelib install hxcpp
    fi

    echo "Installing json2object..."
    if command -v doas &> /dev/null
    then
        doas haxelib install json2object
    else 
        sudo haxelib install json2object
    fi
fi

echo "Compiling to Neko..."
haxe ./Install.hxml
echo "Compiling Neko to an executable..."
nekotools boot bin/doen.n
echo "Moving the executable to /usr/bin/..."
if command -v doas &> /dev/null
then
    doas cp ./bin/doen /usr/bin
else 
    sudo cp ./bin/doen /usr/bin
fi

echo "Done!"