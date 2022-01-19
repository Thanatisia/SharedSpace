/* 
	Class Declaration
	- Inside Student.h 
*/

// Student class with set functions for private data
class Student
{
	private:
		int idNum;
		string lastName;
		double gpa;

	public:
		// prototype functions in student.h
		void displayStudentData();
		void setIdNum(int);
		void setLastName(string);
		void setGPA(double);
};