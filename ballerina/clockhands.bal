import ballerina/io;

public function main() {
    foreach int i in 0...10 {
        int t = (43200 * i + 21600) / 11;
        int h = t / 3600;
        int m = t / 60 % 60;
        int s = t % 60;
        io:println((h == 0 ? "12" : h.toString().padZero(2)) + ":" 
            + (m).toString().padZero(2) + ":" 
            + (s).toString().padZero(2));
    }
}