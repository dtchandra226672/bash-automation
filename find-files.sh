# Utils
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
RED='\033[0;31m'

cd ~; ls;

while true; do
    echo "${YELLOW}Which directory to go?${NC}"
    read dest_dir;

    if test -d ./$dest_dir; then
        echo "${GREEN}Directory found! Moved to $dest_dir \n"${NC};
        cd ./$dest_dir; # ls;
        break;
    else
        echo "${RED}Directory $dest_dir does not exist, please try again. Please re-enter${NC}" 
        continue;
    fi
done

echo "${YELLOW}I will help you find the files that you need! Please enter the keywords (end by '.')${NC}"
find_parameters=""

while true; do
    read input;

    if [ "$input" == "." ]; then
        bash -c "find . -type f -maxdepth 1 $find_parameters";
        break;
    else
        find_parameters+="-name \"*$input*\" "
        continue;
    fi
done

cd ~;