#include <iostream>
#include <string>
#if defined(WIN32) || defined(_WIN32) ||                                       \
    defined(__WIN32) && !defined(__CYGWIN__)

#include <windows.h>

#else

#endif

using namespace std;

string toLowerCase(string text) {
  /*for_each(text.begin(), text.end(), [](char& c) {
      c = ::tolower(c);
  });*/
  return text;
}

bool containsText(string textBase, string textToFind) {
  if (toLowerCase(textBase).find(toLowerCase(textToFind), 0) != string::npos) {
    return true;
  }
  return false;
}

string toString(int number) { return std::to_string(number); }
string toString(float number) { return std::to_string(number); }

char *toCharArray(string text) {
  char *charArray;
  string str_obj(text);
  charArray = &str_obj[0];
  return charArray;
}

void clearScreen() {
#if defined(WIN32) || defined(_WIN32) ||                                       \
    defined(__WIN32) && !defined(__CYGWIN__)
  system("cls");
#else
  system("clear");
#endif
}

void pauseProcess() {
#if defined(WIN32) || defined(_WIN32) ||                                       \
    defined(__WIN32) && !defined(__CYGWIN__)
  system("pause");
#else
  string text;

  cout << endl
       << "Ingrese cualquier valor y presione ENTER para continuar" << endl;

  do {
    fflush(stdin);
    getline(cin, text);
  } while (text.length() == 0);

#endif
}

void addDelay(int sec) {
#if defined(WIN32) || defined(_WIN32) ||                                       \
    defined(__WIN32) && !defined(__CYGWIN__)
  Sleep(sec * 1000);
#else
  system(toCharArray("sleep " + toString(sec)));
#endif
}

void gotoxy(int x, int y) {
#if defined(WIN32) || defined(_WIN32) ||                                       \
    defined(__WIN32) && !defined(__CYGWIN__)
  HANDLE hcon;
  hcon = GetStdHandle(STD_OUTPUT_HANDLE);
  COORD dwPos;
  dwPos.X = x;
  dwPos.Y = y;
  SetConsoleCursorPosition(hcon, dwPos);
#else

#endif
}

bool contains(int *integerArray, int arrayLength, int integer) {
  for (int i = 0; i < arrayLength; i++) {
    if (integerArray[i] == integer) {
      return true;
    }
  }

  return false;
}

string getGenre(char genre) {
  if (genre == 'm')
    return "Masculino";
  else if (genre == 'f')
    return "Femenino";
  else
    return "genero no valido";
}

string requestText(string message, long unsigned int minLength) {
  string text;

  cout << message << " (Mínimo " << minLength << " caracteres)" << endl;

  do {
    fflush(stdin);
    getline(cin, text);
  } while (!(minLength <= text.length()));

  return text;
}

string requestText(string message, long unsigned int minLength,
                   long unsigned int maxLength) {
  string text;

  cout << message << " (Mínimo " << minLength << " y máximo " << maxLength
       << " caracteres)" << endl;

  do {
    fflush(stdin);
    getline(cin, text);
  } while (!(minLength <= text.length() && text.length() <= maxLength));

  return text;
}

char requestGenre(string message) {
  char genre;

  cout << message
       << ". Ingrese 'm' para genero masculino o 'f' para genero femenino?"
       << endl;
  cin >> genre;

  while (!(genre == 'm' || genre == 'f')) {
    cout << "Por favor, ingrese solo 'm' o 'f':" << endl;
    fflush(stdin);
    cin >> genre;
  }

  return genre;
}

int requestIntegerNumber(string message, int min) {
  int integer;

  cout << message << " (Mínimo " << min << ")" << endl;
  cin >> integer;

  while (!(min <= integer)) {
    cout << "Por favor, introduzca un valor mínimo de " << min << "." << endl;
    fflush(stdin);
    cin >> integer;
  }

  return integer;
}

int requestIntegerNumber(string message, int min, int max) {
  int integer;

  cout << message << "(Mínimo " << min << " y máximo " << max << ")" << endl;
  cin >> integer;

  while (!(min <= integer && integer <= max)) {
    cout << "Por favor, introduzca un valor mínimo de " << min
         << " o máximo de " << max << "." << endl;
    fflush(stdin);
    cin >> integer;
  }

  return integer;
}

unsigned short requestAge(string message, int min) {
  return requestIntegerNumber(message, min);
}

unsigned short requestAge(string message, int min, int max) {
  return requestIntegerNumber(message, min, max);
}

float requestMoney(string message, int min) {
  float amount;

  cout << message << "(Mínimo S/" << min << ")" << endl;
  cin >> amount;

  while (!(min <= amount)) {
    cout << "Por favor, ingrese una cantidad mínima de S/" << min << "."
         << endl;
    fflush(stdin);
    cin >> amount;
  }

  return amount;
}

float requestMoney(string message, int min, int max) {
  float amount;

  cout << message << "(Mínimo S/" << min << " y máximo S/" << max << ")"
       << endl;
  cin >> amount;

  while (!(min <= amount && amount <= max)) {
    cout << "Por favor, ingrese una cantidad mínima de S/" << min
         << " y máxima de S/" << max << "." << endl;
    fflush(stdin);
    cin >> amount;
  }

  return amount;
}

string requestSearchTerm() {
  return requestText("Ingrese el termino de busqueda", 2);
}

string requestDate(string message) {
  string date;

  // Year
  int year = requestIntegerNumber("Año:", 1900, 2050);

  // Month
  int selectedMonth;
  string months[12];
  months[0] = "Enero";
  months[1] = "Febrero";
  months[2] = "Marzo";
  months[3] = "Abril";
  months[4] = "Mayo";
  months[5] = "Junio";
  months[6] = "Julio";
  months[7] = "Agosto";
  months[8] = "Septiembre";
  months[9] = "Octubre";
  months[10] = "Noviembre";
  months[11] = "Diciembre";

  cout << endl << "Mes:" << endl << endl;

  for (int i = 0; i < 12; i++) {
    cout << "[" << (i + 1) << "] " << months[i] << endl;
  }

  cout << endl << "Introduzca la opción deseada:" << endl;
  cin >> selectedMonth;
  while (!(1 <= selectedMonth && selectedMonth <= 12)) {
    cout << "Introdujo una opción inválida, por favor seleccione una opción "
            "válida:"
         << endl;
    cin >> selectedMonth;
  }
  selectedMonth--;

  int maxDays;
  if (selectedMonth == 0 || selectedMonth == 2 || selectedMonth == 4 ||
      selectedMonth == 6 || selectedMonth == 7 || selectedMonth == 9 ||
      selectedMonth == 11) {
    maxDays = 31;
  } else if (selectedMonth == 3 || selectedMonth == 5 || selectedMonth == 8 ||
             selectedMonth == 10) {
    maxDays = 30;
  } else if (selectedMonth == 1 && year % 4 == 0) {
    maxDays = 29;
  } else {
    maxDays = 28;
  }

  // Day
  int day = requestIntegerNumber("Día del mes:", 1, maxDays);

  return toString(year) + "/" + months[selectedMonth] + "/" + toString(day);
}
