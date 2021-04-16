#include "helpers.h"
#include "structs.h"
#include <iostream>

using namespace std;

void collectionsInitialization(personsList &persons) {
  persons.firstNode = NULL;
  persons.length = 0;
}

personStruct buildPerson(string firstName, string lastName, unsigned short age,
                         char genre) {
  personStruct person;
  person.firstName = firstName;
  person.lastName = lastName;
  person.age = age;
  person.genre = genre;

  return person;
}

void addToCollection(personsList &persons, personStruct newPerson) {
  personNode *newNode = new personNode();

  personNode *lastNode = persons.firstNode;

  newNode->person = newPerson;
  newNode->next = NULL;

  if (persons.firstNode == NULL) {
    persons.firstNode = newNode;
    persons.firstNode->previous = NULL;
    return;
  }

  while (lastNode->next != NULL) {
    lastNode = lastNode->next;
  }

  lastNode->next = newNode;
  newNode->previous = lastNode;

  persons.length++;
}

void dataInitialization(personsList &persons) {
  personStruct salfa, lama, monty;

  salfa = buildPerson("Juan Andres", "Salfate", 50, 'm');
  lama = buildPerson("Alfredo", "Lamadrid", 40, 'm');
  monty = buildPerson("Monserrat", "Torrent", 30, 'f');

  addToCollection(persons, salfa);
  addToCollection(persons, lama);
  addToCollection(persons, monty);
}

void showPerson(personStruct person, int i) {
  gotoxy(0, 9 + i);
  cout << i;
  gotoxy(5, 9 + i);
  cout << person.firstName;
  gotoxy(20, 9 + i);
  cout << person.lastName;
  gotoxy(35, 9 + i);
  cout << person.age;
  gotoxy(45, 9 + i);
  cout << getGenre(person.genre);
}
