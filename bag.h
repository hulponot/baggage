#ifndef BAG_H
#define BAG_H

#include<vector>
#include<string>

using std::string;
using std::vector;

class Bag
{

public:

    int x();
    int y();
    bool isCatched();

    void setX(int x);
    void setY(int y);
    void setIsCatched(bool u);

    int isFull();
    bool add(string);
    void remove(int i);

    vector<string> whatIsIn;

    explicit Bag();
    ~Bag();

    int _x;
    int _y;
    bool _isCatched;
};

#endif // BAG_H
