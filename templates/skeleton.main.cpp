#include "menu.h"

using namespace std;

int main() {
  personsList persons;

  collectionsInitialization(persons);
  dataInitialization(persons);

  mainMenu(persons);

  return 0;
}
