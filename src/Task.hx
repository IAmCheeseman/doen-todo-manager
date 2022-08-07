class Task {
	public var name:String;
	var _isFinished:Bool;

	public function new(name:String):Void {
		this.name = name;
		_isFinished = false;
	}

	public function isFinished():Bool {
		return _isFinished;
	}

	public function finish():Void {
		_isFinished = true;
	}

	public function toString():String {
		return '${if (_isFinished) "☑" else "☐"} $name';
	}
}
