CC = g++

all: client ao reactor guard singleton

ao: queue.o active_object.o
	$(CC) -o ao queue.o active_object.o -pthread
client: client.o
	$(CC) -o client client.o -pthread
reactor: reactor.o
	$(CC) -o reactor reactor.o
guard: guard.o
	$(CC) -o guard guard.o -pthread
singleton: singleton.o
	$(CC) -o singleton singleton.o

ao.o: active_object.cpp
	$(CC) -c active_object.cpp

queue.o: queue.cpp
	$(CC) -c queue.cpp

client.o: client.cpp
	$(CC) -c client.cpp

reactor.o: reactor.cpp
	$(CC) -c reactor.cpp

guard.o:
	$(CC) -c guard.cpp

singleton.o:
	$(CC) -c singleton.cpp

.PHONY: clean all

clean:
		rm -f *.o client ao reactor guard singleton