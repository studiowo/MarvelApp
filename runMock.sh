go build -o MarvelMock main.go
ps -ef | grep MarvelMock | grep -v grep | awk '{print $2}' | xargs kill
./MarvelMock > /dev/null 2>&1 &
