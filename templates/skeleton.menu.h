#include "structFunctions.h"

using namespace std;

void showAppTitle() {
  cout << endl;
  cout << "-----------------------------------------------------------";
  cout << endl << "\t\t C++ App" << endl << endl;
  cout << "-----------------------------------------------------------";
}

int requestMenuOption() {
  int selectedOption;

  clearScreen();
  showAppTitle();

  cout << endl
       << "Esta aplicación tiene las siguientes opciones:" << endl
       << endl;

  cout << "[1] Registrar persona" << endl;
  cout << "[2] Ver personas registradas" << endl;
  cout << "[0] Cerrar" << endl;

  cout << endl << "Por favor ingrese una de las opciones:" << endl;
  cin >> selectedOption;
  while (!(0 <= selectedOption && selectedOption <= 2)) {
    cout << "La opcion seleccionada fue inválida, por favor seleccione una "
            "opcion válida:"
         << endl;
    cin >> selectedOption;
  }
  return selectedOption;
}

void registerNewPerson(personsList &persons) {
  personStruct newPerson;
  string firstName, lastName;
  unsigned short age;
  char genre;

  cout << "Va a registrar una nueva persona" << endl << endl;

  firstName = requestText("Ingrese los nombres de la nueva persona", 2);
  lastName = requestText("Ingrese los apellidos de la nueva persona", 2);
  age = requestAge("Ingrese la edad de la nueva persona", 0);
  genre = requestGenre("Ingrese el genero de la nueva persona");

  newPerson = buildPerson(firstName, lastName, age, genre);

  addToCollection(persons, newPerson);

  cout << "La persona ha sido registrada correctamente";
}

void showPersons(personsList persons) {
  clearScreen();
  showAppTitle();

  gotoxy(10, 6);
  cout << "Personas" << endl;

  personNode *node = persons.firstNode;

  gotoxy(0, 8);
  cout << "#";
  gotoxy(5, 8);
  cout << "Nombre";
  gotoxy(20, 8);
  cout << "Apellido";
  gotoxy(35, 8);
  cout << "Edad";
  gotoxy(45, 8);
  cout << "Genero";

  int i = 1;
  while (node != NULL) {
    showPerson(node->person, i);
    node = node->next;
    i++;
  }

  cout << endl << endl;
}

void mainMenu(personsList &persons) {
  int selectedOption;

  do {
    selectedOption = requestMenuOption();

    if (selectedOption != 0) {
      switch (selectedOption) {
      case 1:
        registerNewPerson(persons);
        addDelay(2);
        break;

      case 2:
        showPersons(persons);
        pauseProcess();
        break;
      }
    }

  } while (!(selectedOption == 0));

  cout << "Gracias por usar la app, tenga un buen día!";
}
