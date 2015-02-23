#include "bag.h"

Bag::Bag()
{
    _x = 500;
    _y = 300;
    _isCatched = false;

    for(int i=0;i<6;i++)
        whatIsIn.push_back("nothing");
}

Bag::~Bag()
{

}

int Bag::x()
{
    return _x;
}

int Bag::y()
{
    return _y;
}

bool Bag::isCatched()
{
    return _isCatched;
}

void Bag::setX(int x){
    _x = x;
}

int Bag::isFull()
{
    for (int i=0;i<6;i++)
        if (whatIsIn.at(i) == "nothing")
            return i;
    return -1;
}

bool Bag::add(string str)
{
    int i = this->isFull();
    if(i == -1)
        return false;
    whatIsIn[i] = str;
    return true;
}

void Bag::remove(int i)
{
    whatIsIn[i] = "nothing";
}

void Bag::setY(int y){
    _y = y;
}

void Bag::setIsCatched(bool u){
    _isCatched = u;
}
