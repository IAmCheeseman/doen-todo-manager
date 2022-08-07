# doen-todo-manager
A todo manager written in Haxe.

## Installing

```sh
git clone https://github.com/IAmCheeseman/doen-todo-manager.git doen
cd doen
sh install.sh
```

`install.sh` will just install some dependencies, and then compile the project.

You need `haxe` and `haxelibe` to compile, these will not be installed by `install.sh`.

<details>
    <summary>Dependencies</summary>

`hxcpp`

`json2object`

</details>

## Commands

`doen add "task name"` - adds a task.

`doen remove <index>` - removes task at index.

`doen finish <index>` - finishes task at index.
