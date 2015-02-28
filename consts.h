#ifndef CONSTS_H
#define CONSTS_H

#include <string>
#include <map>
#include<vector>

using std::vector;
using std::string;
using std::map;

const int MAX_STUFF =  12;
const int MAX_PLACES = 12;

struct Coord;

class Consts
{
public:
    static map<int,string> stuff;
    static map<string,vector<Coord> > roomsCoords;

    Consts();
    ~Consts();


    void addRoom(string,vector<int>);
};

#endif // CONSTS_H

struct Coord
{
    int x;
    int y;
};
