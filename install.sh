#! /usr/bin/bash

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

echo "Compiling to Neko..."
haxe ./Install.hxml
echo "Compiling Neko to an executable..."
nekotools boot bin/doen.n
echo "Moving the executable to /usr/bin/..."
if command -v doas &> /dev/null
then
    doas mv ./bin/doen /usr/bin
else 
    sudo mv ./bin/doen /usr/bin
fi

echo "Done!"