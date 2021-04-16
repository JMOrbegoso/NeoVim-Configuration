#include <iostream>

using namespace std;

struct personStruct {
  string firstName;
  string lastName;
  unsigned short age;
  char genre;
};

struct personNode {
  personStruct person;
  personNode *previous;
  personNode *next;
};

struct personsList {
  personNode *firstNode;
  int length;
};
