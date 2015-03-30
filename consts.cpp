#include "consts.h"



map<int,string> setMap(int cls);



map<int,string> Consts::stuff = setMap(0);
map<string,vector<Coord> > Consts::roomsCoords;
map<int,vector<Coord> > Consts::doorsCoords;

Consts::Consts()
{

    vector<int> coords;
    coords.push_back(1680); coords.push_back(133);
    coords.push_back(1604); coords.push_back(430);
    coords.push_back(1360); coords.push_back(850);
    coords.push_back(80); coords.push_back(870);
    coords.push_back(840); coords.push_back(420);
    coords.push_back(1640); coords.push_back(900);
    addRoom("room-0",coords);

    //да простит господь грехи мои
    coords.push_back(140); coords.push_back(600);
    coords.push_back(500); coords.push_back(550);
    coords.push_back(842); coords.push_back(510);
    coords.push_back(1220); coords.push_back(650);
    coords.push_back(1700); coords.push_back(280);
    coords.push_back(1500); coords.push_back(580);
    addRoom("kitchen-0",coords);

    coords.clear();
    coords.push_back(75); coords.push_back(493);
    coords.push_back(412); coords.push_back(493);
    coords.push_back(796); coords.push_back(493);
    coords.push_back(1128); coords.push_back(493);
    coords.push_back(1419); coords.push_back(13);
    //for genericRoom
    coords.push_back(1600); coords.push_back(126);
    addDoor(0,coords);
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
       temp[2] = "compass";
       temp[3] = "toothBrush";
       temp[4] = "cup";
       temp[5] = "kettle";
       temp[6] = "phone";

       for(int i=7;i<MAX_PLACES;i++)
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
void Consts::addDoor(int lvl, vector<int> coords)
{
    vector<Coord> vCoords;
    for (unsigned int i=0;i<coords.size();i++){
        Coord coord;
        coord.x = coords[i++];
        coord.y = coords[i];
        vCoords.push_back(coord);
    }
    doorsCoords[lvl] = vCoords;
}
