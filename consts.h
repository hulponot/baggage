#ifndef CONSTS_H
#define CONSTS_H

#include <string>
#include <map>
#include<vector>

using std::vector;
using std::string;
using std::map;

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
