COMP            = g++ 
FLAGS           = -g -Wall
LIBS            =  
OBJ1_LIST       = i8051.o main.o
OBJ2_LIST       = i8051.o syn.o
TARGET1_NAME    = 8051sim
TARGET2_NAME    = 8051syn

all: $(TARGET1_NAME) $(TARGET2_NAME)

$(TARGET1_NAME): $(OBJ1_LIST)
	$(COMP) $(FLAGS) -o $(TARGET1_NAME) $(OBJ1_LIST) $(LIBS)

$(TARGET2_NAME): $(OBJ2_LIST)
	$(COMP) $(FLAGS) -o $(TARGET2_NAME) $(OBJ2_LIST) $(LIBS)

%.o: %.cc %.h
	$(COMP) $(FLAGS) -c $<

clean:
	rm -f *.o *~ core $(TARGET1_NAME)
