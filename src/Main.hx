import sys.FileSystem;
import sys.io.File;
import haxe.Json;
import json2object.JsonParser;

class Main {
    static final path = "/.local/share/doen/todo.json";

    static function main() {
        var home = Sys.getEnv(if (Sys.systemName() == "Windows") "UserProfile" else "HOME");
        var savePath = home + path;
        
        var list: DoenList;
        if (!FileSystem.exists(savePath)) {
            FileSystem.createDirectory(home + "/.local/share/doen");
            list = new DoenList();
        } else {
            var file = File.read(savePath);
            var jsonParser = new JsonParser<Map<String, Bool>>();
            var data = jsonParser.fromJson(file.readAll().toString());
            list = DoenList.fromMap(data);
            file.close();
        }

        list.process();

        var json = Json.stringify(list.toMap(), "\t");
        File.saveContent(savePath, json);
    }
}
