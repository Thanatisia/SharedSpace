/*
	Class Implementation

	- in Student.cpp
*/

/* Business Logic */
void Student::setLastName(string name)
{
	lastName = name;
}

void Student::setIdNum(int num)
{
	const int MAX_NUM = 9999;
	if (num <= MAX_NUM)
	{
		idNum = num;
	}
	else
	{
		idNum = MAX_NUM;
	}
}

