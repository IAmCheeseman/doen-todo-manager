# Doen Todo Manager
A todo manager written in Haxe. Not meant for actual use, but install instructions are here nonetheless.

![image](https://user-images.githubusercontent.com/64710123/183302338-d626b4fe-7f4d-45f4-bd97-cb8d67ade4b0.png)

## Installing

```sh
git clone https://github.com/IAmCheeseman/doen-todo-manager.git doen
cd doen
sh install.sh
```

`install.sh` will just install some dependencies, and then compile the project.

You need `haxe` and `haxelib` to compile, these will not be installed by `install.sh`.

<details>
    <summary>Dependencies</summary>

`hxcpp`

`json2object`

</details>

## Commands

`doen add "task name"` - adds a task.

`doen remove <index>` - removes task at index.

`doen finish <index>` - finishes task at index.
