/*
	Demonstration main() function using the Declaration and Implementation
	- To compile:
		g++ StudentTest.cpp Student.cpp -o main.exe
*/


// Import Header File
#include "Student.h";

int main()
{
	/*
		- Always practice unit testing before integration testing
	*/
	Student aStudent;
	aStudent.setLastName("Smith");
	aStudent.setIdNum(3456);
	aStudent.setGPA(3.5);
	aStudent.displayStudentData();
}