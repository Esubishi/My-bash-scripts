function cr()
{
  if [[ "$1" == "-b" ]]; then
    if [[ ! "$2" ]]; then
      echo "Error: no language selected"
    fi
    if [[ "$2" == "c" || "$2" == "cpp" ]]; then
      mkdir src include bin bin/debug bin/release lib
    fi
  elif [[ "$1" == "-d" ]]; then
    mkdir "$2"
  elif [[ "$1" == "-f" ]]; then
    touch "$2"
  elif [[ "$1" == "-help" ]]; then
    echo "Cr (Create help)"
    echo "Modes : -b (build): creates all the folder neccesary for making a program in a language"
    echo "      : -d (directory): creates a directory"
    echo "      : -f (file): creates a file"
  else
    echo "Error: no mode selected"
  fi
}

function build()
{
  if [[ "$1" == 'c' ]]; then
    if [[ "$2" == "-d" ]]; then
      gcc -c src/*.c -I include && gcc *.o -o bin/debug/main && ./bin/debug/main
    elif [[ "$2" == "-r" ]]; then
      gcc -c src/*.c -I include && gcc *.o -o bin/release/main && ./bin/release/main
    fi
  elif [[ "$1" == "cpp" ]]; then
    if [[ "$2" == "-d" ]]; then
      g++ -c src/*.cpp -I include && g++ *.o -o bin/debug/main && ./bin/debug/main
    elif [[ "$2" == "-r" ]]; then
      g++ -c src/*.cpp -I include && g++ *.o -o bin/release/main && ./bin/release/main
    fi
  fi
}
