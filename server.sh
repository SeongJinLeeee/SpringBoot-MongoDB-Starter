rootdir="$( cd "$(dirname "$0")" ; pwd -P )"
dbdir=$rootdir/mongodb

function server_intro {
    cecho "BLUE"  "-------------------------------------------------------------------------"
    cecho "GREEN"   "                   React Native BC TMS Server Project "
    cecho "BLUE"  "-------------------------------------------------------------------------"
}

function projmaker_usage {
    cecho "BLUE"  "-------------------------------------------------------------------------"
    cecho "RED"   "                              Not implemented yet "
    cecho "BLUE"  "-------------------------------------------------------------------------"
}

cecho(){
    RED="\033[1;31m"
    GREEN="\033[0;32m"
    YELLOW="\033[0;33m"
    BLUE="\033[1;34m"
    DARKGRAY="\033[0;90m"
    NC="\033[0m"
    str="${@:2:${#@}}"
    printf "${!1}${str}  ${NC}\n"
}

function server_clean {
    case $1 in
        all )
            rm -rf $rootdir/target
            rm -rf $rootdir/mongodb/data
            ;;
        target )
            rm -rf $rootdir/target
            ;;
        db )
            rm -rf $rootdir/mongodb/data
            ;;
    esac
}

# Start the server
function server_start {
    docker pull mongo
    docker run --name mongodb -v $rootdir/mongodb/data:/data/db -d -p 27017:27017 mongo
    mvn spring-boot:run
}

# If you add some Tests, you would start them
function server_test {
    # for unit test
    mvn clean test
    
    # for end to end test
    mvn clean integration-test
}

# You can build the project
function server_build {
    mvn clean package
    
    case $1 in
        run )
            cmd=server_$1
            shift
            $cmd
            ;;
    esac
}

# You can run the project with the fat jar and the embedded Tomcat
function server_run {
    java -jar $rootdir/target/java-spring-boot-mongodb-starter-1.0.0.jar
}

function main {
    server_intro
    
    case $1 in
        start | clean | bundle | run | release )
            cmd=server_$@
            shift
			$cmd
            ;;
        *)
            cecho "RED"   "[$1] is not supported command!"
            server_usage
			exit
            ;;
    esac
}

main $@