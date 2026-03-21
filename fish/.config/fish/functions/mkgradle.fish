function mkgradle
    set project_name $argv[1]
    if test -z "$project_name"
        echo "Usage: mkjava <project_name>"
        return 1
    end

    mkdir -p $project_name/src/main/java
    cd $project_name

    echo "rootProject.name = '$project_name'" > settings.gradle

    echo "plugins {
    id 'java'
    id 'application'
}

repositories {
    mavenCentral()
}

application {
    mainClass = project.hasProperty('ex') ? project.property('ex') : 'Main'
}" > build.gradle

    echo "public class Main {
    public static void main(String[] args) {
        System.out.println(\"Running from Root Main Sandbox...\");
    }
}" > src/main/java/Main.java

    echo "Successfully initialized $project_name"
    ls -R
end
