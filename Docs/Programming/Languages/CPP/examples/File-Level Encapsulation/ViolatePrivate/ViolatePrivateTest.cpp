int main()
{
    ViolatePrivate A;
    cout << A.value1 << endl;
    cout << A.value2 << endl;
    cout << *(&A.value1 + 1) << endl;
    A.display();
    cin >> *(&(A.value1) + 1);
    A.display();
    return 0;
}
