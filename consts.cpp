#include "consts.h"



map<int,string> setMap(int cls);



map<int,string> Consts::stuff = setMap(0);
map<string,vector<Coord> > Consts::roomsCoords;

Consts::Consts()
{
    vector<int> coords;
    coords.push_back(100); coords.push_back(600);
    coords.push_back(100); coords.push_back(500);
    coords.push_back(500); coords.push_back(100);
    coords.push_back(300); coords.push_back(500);
    addRoom("room-0",coords);
}

Consts::~Consts()
{

}



map<int,string> setMap(int cls)
{
   map<int,string> temp;
   if (cls == 0){
       temp[0] = "knife";
       temp[1] = "lucifers";

       for(int i=2;i<MAX_PLACES;i++)
           temp[i] = "nothing";
   }
   else {
       temp[0] = "s";
   }
   return temp;
}


void Consts::addRoom(string title,vector<int> coords)
{
    vector<Coord> vCoords;
    for (unsigned int i=0;i<coords.size();i++){
        Coord coord;
        coord.x = coords[i++];
        coord.y = coords[i];
        vCoords.push_back(coord);
    }
    roomsCoords[title] = vCoords;
}
