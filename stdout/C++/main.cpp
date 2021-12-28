#include <string>
#include <iostream>
#include <fstream>


using namespace std;

int main (int) {
     for(int i=1; i>=1; i++){
    std::ifstream file("countries.txt");
	std::string str;
	while (std::getline(file, str))
    cout <<  str << endl;
}
