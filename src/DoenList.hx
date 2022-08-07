import haxe.ds.List;



class DoenList {
	var _tasks:Array<Task> = [];

	public function new() {}


    static public function fromMap(map:Map<String, Bool>) {
        var list = new DoenList();

        var i = 0;
        for (name => finished in map) {
            list.addTask(name);
            if (finished) list.finishTask(i);

            i++;
        }
        

        return list;
    }

	public function process() {
		var args = Sys.args();
		var action = args[0];

		switch action {
			case "add":
				addTask(args[1]);
                Sys.println(this);
			case "remove":
                try {
                    var task = Std.parseInt(args[1]);
                    if (task > _tasks.length) {
                        Sys.println('Expected a number smaller than ${_tasks.length}.');
                    } else if (task < 0) {
                        Sys.println('Expected a number larger than 0.');
                    }
                    removeTask(task);
                    Sys.println(this);
                } catch (error) {
                    Sys.println('Expected an integer as an argument to "remove"');
                }
            case "finish":
                try {
                    var task = Std.parseInt(args[1]);
                    if (task > _tasks.length) {
                        Sys.println('Expected a number smaller than ${_tasks.length}.');
                    } else if (task < 0) {
                        Sys.println('Expected a number larger than 0.');
                    }
                    finishTask(task);
                    Sys.println(this);
                } catch (error) {
                    Sys.println('Expected an integer as an argument to "finish"');
                }
            case "show":
                Sys.println(this);
            case _:
                Sys.println("Invalid command.");
		}
	}

	public function removeTask(task:Int):Void {
        var newTasks = [];
        for (i in 0..._tasks.length) {
            if (i == task) {
                continue;
            }
            newTasks.push(_tasks[i]);
        }
        _tasks = newTasks;
	}

	public function addTask(task:String):Void {
		_tasks.push(new Task(task));
	}

	public function finishTask(task:Int) {
		_tasks[task].finish();
	}

	public function toString():String {
		var out = "---- TODO ----";
		for (i in _tasks) {
			out += "\n" + i;
		}

		return out;
	}

    public function toMap():Map<String, Bool> {
        var map:Map<String, Bool> = [];

        for (task in _tasks) {
            map[task.name] = task.isFinished();
        }

        return map;
    }
}
